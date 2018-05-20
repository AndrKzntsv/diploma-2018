from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait

from tools.locators import Locators as locators
from tools.screenshot import screenshot


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
