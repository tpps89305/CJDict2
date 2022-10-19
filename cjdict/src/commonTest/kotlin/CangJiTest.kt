import com.dispy.cjdict2.CangJi3Dict
import kotlin.test.Test
import kotlin.test.assertEquals

/**
 * Created by Dispy-Yang on 2022/10/19.
 *
 * @author yangchaofu
 * @since 2022/10/19
 */
class CangJiTest {

    private val cj3Dict = CangJi3Dict()

    @Test
    fun testFunc() {
        assertEquals("十女", cj3Dict.getCangJiCode("安").first().root)
    }
}