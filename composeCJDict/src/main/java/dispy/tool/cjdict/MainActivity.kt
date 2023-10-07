package dispy.tool.cjdict

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TopAppBarColors
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import com.dispy.cjdict2.Greeting
import dispy.tool.cjdict.ui.theme.CJDict2Theme
import dispy.tool.cjdict.ui.theme.Purple80

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            CJDict2Theme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    Column {
                        CJDictAppBar()
                        Hello()
                    }
                }
            }
        }
    }
}

@Composable
fun Hello(modifier: Modifier = Modifier) {
    Text(
        text = Greeting().greeting(),
        modifier = modifier
    )
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CJDictAppBar() {
    TopAppBar (
        colors = TopAppBarDefaults.smallTopAppBarColors(
            containerColor = Purple80
        ),
        title = { Text(text = "倉頡字典")}
    )
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    CJDict2Theme {
        Hello()
    }
}

@Preview(showBackground = true)
@Composable
fun TopAppBarPreview() {
    CJDict2Theme {
        CJDictAppBar()
    }
}