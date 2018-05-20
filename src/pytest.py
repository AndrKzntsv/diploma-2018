from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait

from tools.constants import DEFAULT_TIMEOUT
from tools.locators import Locators as locators
from tools.screenshot import screenshot


@screenshot
def test_check_header_logo(browser, device):
    reach_logo = browser.find_element(*locators.reach_logo)

    if device == 'Reach':
        assert '/reach.' in reach_logo.get_attribute('src')
    elif device == 'ReachRS':
        assert '/reach_rs.' in reach_logo.get_attribute('src')


@screenshot
def test_check_battery_icon(browser, device):
    if device == 'Reach':
        WebDriverWait(browser, 0).until_not(
            EC.visibility_of_any_elements_located(locators.battery_icon)
        )
    elif device == 'ReachRS':
        WebDriverWait(browser, 0).until(
            EC.visibility_of_any_elements_located(locators.battery_icon)
        )


@screenshot
def test_check_camera_tab_link(browser, breakpoint, device):
    if breakpoint == 'xs':
        menu_icon = browser.find_element(*locators.menu_icon_mobile)

        ActionChains(browser).move_to_element_with_offset(menu_icon, 10, 10).click().perform()

        WebDriverWait(browser, DEFAULT_TIMEOUT).until(
            EC.visibility_of_element_located(locators.menu_container)
        )

    if device == 'Reach':
        WebDriverWait(browser, 0).until(
            EC.visibility_of_element_located(locators.camera_tab_link)
        )
    elif device == 'ReachRS':
        WebDriverWait(browser, 0).until(
            EC.invisibility_of_element_located(locators.camera_tab_link)
        )