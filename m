Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E2B29FFEF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Oct 2020 09:28:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYPlu-0005N7-5q; Fri, 30 Oct 2020 08:28:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cezary.rojewski@intel.com>) id 1kYPlo-0005Me-Ow
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 08:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uy62HWmMUq9zzWR6Ia9dmsWWbBC63umdBkyBGVuNXgM=; b=kkDM77vI5zv8vtoOgCEZJutP4K
 Hzb0m9xcw9rfB3+Y1Z888u/oThyUoE7GCIhO4sPwDF2ya2SdE1nUr9wMZvdx8LZSh2CG7p5DOGfm4
 sB0rYPfNothKvB8D0UoydxuFDuJ1Wjyp1dYhtaod+poTOtFY+v+N50BJXmxputYpjrJw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uy62HWmMUq9zzWR6Ia9dmsWWbBC63umdBkyBGVuNXgM=; b=Tnz6pE26ue/fo1/xvh6/i+123J
 7/PAEyi0Nz9ABpOrZIWOCqVvgRtJA4u4IjCkogg8R/Q+PFwQ2AnW361Eg/1lxTCB3nLc6w4LFH/Sj
 7Zqi5oOfm57O5nBcbysCuJ1OBcrAsFJ2G2TJg2qXh+/y5ftxnXEoESpLzrDIev5a1mKo=;
Received: from mga04.intel.com ([192.55.52.120])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kYPli-00CfVB-1z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 08:28:24 +0000
IronPort-SDR: moZzJ5HGfmfxzk9GeGhNzYQncZZTLgkfk1BCYOz9a7CDrNyYz9pP5ox6dppcHNkh6KoYiB2AUA
 1DMpamVt1qPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="165991014"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="165991014"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 01:28:12 -0700
IronPort-SDR: n1HHEB9ts0l6DRLrZkuICGJLMrYMWW0u6YftTRRadpfz7BwES/F6lRr74fLbRXgSa/FyDcLH01
 8I0qTKmcSuYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="361780723"
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Oct 2020 01:27:54 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 30 Oct 2020 08:27:53 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Fri, 30 Oct 2020 08:27:53 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
Thread-Topic: [PATCH v2 31/39] docs: ABI: cleanup several ABI documents
Thread-Index: AQHWrpAPMHjRWbJLhkqA2R8Yjt3++6mvz6Og
Date: Fri, 30 Oct 2020 08:27:53 +0000
Message-ID: <372d38f00a9349c6b14b0b00fb1a02b4@intel.com>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
In-Reply-To: <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kYPli-00CfVB-1z
Subject: Re: [f2fs-dev] [PATCH v2 31/39] docs: ABI: cleanup several ABI
 documents
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Peter Chen <peter.chen@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Pavel Machek <pavel@ucw.cz>, Christian Gromm <christian.gromm@microchip.com>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Bart Van Assche <bvanassche@acm.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 Danil Kipnis <danil.kipnis@cloud.ionos.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Guenter Roeck <linux@roeck-us.net>, Ohad Ben-Cohen <ohad@wizery.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Alexander Antonov <alexander.antonov@linux.intel.com>,
 Dan Murphy <dmurphy@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Achatz <erazor_de@users.sourceforge.net>, Konstantin
 Khlebnikov <koct9i@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Wu, Hao" <hao.wu@intel.com>,
 "Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>, Peter
 Meerwald-Stadler <pmeerw@pmeerw.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Hanjun Guo <guohanjun@huawei.com>, Oleh
 Kravchenko <oleg@kaa.org.ua>, Lars-Peter Clausen <lars@metafoo.de>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>, Saravana Kannan <saravanak@google.com>,
 Anton Vorontsov <anton@enomsg.org>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Len Brown <lenb@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oded Gabbay <oded.gabbay@gmail.com>, "Luck, Tony" <tony.luck@intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Boris
 Brezillon <bbrezillon@kernel.org>,
 PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jarkko
 Sakkinen <jarkko@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Heiner
 Kallweit <hkallweit1@gmail.com>, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>,
 "linux-fpga@vger.kernel.org" <linux-fpga@vger.kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jonas Meurer <jonas@freesources.org>, Daniel
 Thompson <daniel.thompson@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Mark Gross <mgross@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Kees Cook <keescook@chromium.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Kuntala,
 Kranthi" <kranthi.kuntala@intel.com>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>,
 Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Roman Sudarikov <roman.sudarikov@linux.intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>, Russell King <linux@armlinux.org.uk>,
 =?utf-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Andrew
 Donnellan <ajd@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>,
 Johan Hovold <johan@kernel.org>, Andreas Klinger <ak@it-klinger.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Asutosh Das <asutoshd@codeaurora.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-10-30 8:40 AM, Mauro Carvalho Chehab wrote:
> There are some ABI documents that, while they don't generate
> any warnings, they have issues when parsed by get_abi.pl script
> on its output result.
> 
> Address them, in order to provide a clean output.
> 
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for IIO
> Reviewed-by: Tom Rix <trix@redhat.com> # for fpga-manager
> Reviewed-By: Kajol Jain<kjain@linux.ibm.com> # for sysfs-bus-event_source-devices-hv_gpci and sysfs-bus-event_source-devices-hv_24x7
> Acked-by: Oded Gabbay <oded.gabbay@gmail.com> # for Habanalabs
> Acked-by: Vaibhav Jain <vaibhav@linux.ibm.com> # for sysfs-bus-papr-pmem
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

sysfs-bus-pci-devices-catpt changes LGTM, thanks.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com> # for catpt

Regards,
Czarek

>   Documentation/ABI/obsolete/sysfs-class-dax    |   8 +-
>   .../ABI/obsolete/sysfs-driver-hid-roccat-pyra |   3 +
>   Documentation/ABI/removed/devfs               |   1 +
>   Documentation/ABI/removed/raw1394             |   1 +
>   Documentation/ABI/removed/sysfs-class-rfkill  |   2 +-
>   Documentation/ABI/removed/video1394           |   1 +
>   Documentation/ABI/stable/firewire-cdev        |  63 ++---
>   Documentation/ABI/stable/sysfs-acpi-pmprofile |   4 +-
>   Documentation/ABI/stable/sysfs-bus-w1         |   1 +
>   Documentation/ABI/stable/sysfs-class-tpm      |   4 +-
>   Documentation/ABI/stable/sysfs-driver-speakup |   4 +
>   Documentation/ABI/testing/configfs-most       | 135 +++++++----
>   .../ABI/testing/configfs-usb-gadget-ecm       |  12 +-
>   .../ABI/testing/configfs-usb-gadget-eem       |  10 +-
>   .../ABI/testing/configfs-usb-gadget-loopback  |   6 +-
>   .../testing/configfs-usb-gadget-mass-storage  |  18 +-
>   .../ABI/testing/configfs-usb-gadget-midi      |  14 +-
>   .../ABI/testing/configfs-usb-gadget-printer   |   6 +-
>   .../testing/configfs-usb-gadget-sourcesink    |  18 +-
>   .../ABI/testing/configfs-usb-gadget-subset    |  10 +-
>   .../ABI/testing/configfs-usb-gadget-uac2      |  14 +-
>   .../ABI/testing/configfs-usb-gadget-uvc       |   2 +-
>   .../ABI/testing/debugfs-cec-error-inj         |   2 +-
>   .../ABI/testing/debugfs-driver-habanalabs     |  12 +-
>   .../ABI/testing/debugfs-pfo-nx-crypto         |  28 +--
>   Documentation/ABI/testing/debugfs-pktcdvd     |   2 +-
>   .../ABI/testing/debugfs-turris-mox-rwtm       |  10 +-
>   Documentation/ABI/testing/debugfs-wilco-ec    |  21 +-
>   Documentation/ABI/testing/dell-smbios-wmi     |  32 +--
>   Documentation/ABI/testing/gpio-cdev           |  13 +-
>   Documentation/ABI/testing/procfs-diskstats    |   6 +-
>   Documentation/ABI/testing/procfs-smaps_rollup |  48 ++--
>   Documentation/ABI/testing/pstore              |  19 +-
>   Documentation/ABI/testing/sysfs-block-rnbd    |   4 +-
>   Documentation/ABI/testing/sysfs-bus-acpi      |   1 +
>   .../testing/sysfs-bus-coresight-devices-etb10 |   5 +-
>   Documentation/ABI/testing/sysfs-bus-css       |   3 +
>   Documentation/ABI/testing/sysfs-bus-dfl       |   2 +
>   .../sysfs-bus-event_source-devices-hv_24x7    |   6 +-
>   .../sysfs-bus-event_source-devices-hv_gpci    |   7 +-
>   Documentation/ABI/testing/sysfs-bus-fcoe      |  68 ++++--
>   Documentation/ABI/testing/sysfs-bus-fsl-mc    |  12 +-
>   .../ABI/testing/sysfs-bus-i2c-devices-fsa9480 |  26 +-
>   Documentation/ABI/testing/sysfs-bus-i3c       |   2 +
>   Documentation/ABI/testing/sysfs-bus-iio       |  19 +-
>   .../ABI/testing/sysfs-bus-iio-adc-hi8435      |   5 +
>   .../ABI/testing/sysfs-bus-iio-adc-stm32       |   3 +
>   .../ABI/testing/sysfs-bus-iio-distance-srf08  |   7 +-
>   .../testing/sysfs-bus-iio-frequency-ad9523    |   2 +
>   .../testing/sysfs-bus-iio-frequency-adf4371   |  10 +-
>   .../ABI/testing/sysfs-bus-iio-health-afe440x  |  12 +-
>   .../ABI/testing/sysfs-bus-iio-light-isl29018  |   6 +-
>   .../testing/sysfs-bus-intel_th-devices-gth    |  11 +-
>   Documentation/ABI/testing/sysfs-bus-papr-pmem |  23 +-
>   Documentation/ABI/testing/sysfs-bus-pci       |  22 +-
>   .../ABI/testing/sysfs-bus-pci-devices-catpt   |   1 +
>   .../testing/sysfs-bus-pci-drivers-ehci_hcd    |   4 +-
>   Documentation/ABI/testing/sysfs-bus-rbd       |  37 ++-
>   Documentation/ABI/testing/sysfs-bus-siox      |   3 +
>   .../ABI/testing/sysfs-bus-thunderbolt         |  18 +-
>   Documentation/ABI/testing/sysfs-bus-usb       |   2 +
>   .../sysfs-class-backlight-driver-lm3533       |  26 +-
>   Documentation/ABI/testing/sysfs-class-bdi     |   1 -
>   .../ABI/testing/sysfs-class-chromeos          |  15 +-
>   Documentation/ABI/testing/sysfs-class-cxl     |   8 +-
>   Documentation/ABI/testing/sysfs-class-devlink |  30 ++-
>   Documentation/ABI/testing/sysfs-class-extcon  |  34 +--
>   .../ABI/testing/sysfs-class-fpga-manager      |   5 +-
>   Documentation/ABI/testing/sysfs-class-gnss    |   2 +
>   Documentation/ABI/testing/sysfs-class-led     |   1 +
>   .../testing/sysfs-class-led-driver-el15203000 |  30 +--
>   .../ABI/testing/sysfs-class-led-driver-lm3533 |  44 ++--
>   .../ABI/testing/sysfs-class-led-flash         |  27 ++-
>   .../testing/sysfs-class-led-trigger-netdev    |   7 +
>   .../testing/sysfs-class-led-trigger-usbport   |   1 +
>   .../ABI/testing/sysfs-class-leds-gt683r       |   8 +-
>   Documentation/ABI/testing/sysfs-class-net     |  61 +++--
>   .../ABI/testing/sysfs-class-net-cdc_ncm       |   6 +-
>   .../ABI/testing/sysfs-class-net-phydev        |   2 +
>   Documentation/ABI/testing/sysfs-class-pktcdvd |  36 +--
>   Documentation/ABI/testing/sysfs-class-power   |  12 +-
>   .../ABI/testing/sysfs-class-power-mp2629      |   1 +
>   .../ABI/testing/sysfs-class-power-twl4030     |   4 +-
>   Documentation/ABI/testing/sysfs-class-rapidio |  46 ++--
>   .../ABI/testing/sysfs-class-regulator         |  36 +--
>   .../ABI/testing/sysfs-class-remoteproc        |  14 +-
>   ...ysfs-class-rtc-rtc0-device-rtc_calibration |   1 +
>   Documentation/ABI/testing/sysfs-class-uwb_rc  |  13 +-
>   .../ABI/testing/sysfs-class-watchdog          |   7 +-
>   Documentation/ABI/testing/sysfs-dev           |   7 +-
>   .../ABI/testing/sysfs-devices-mapping         |  41 ++--
>   .../ABI/testing/sysfs-devices-memory          |  15 +-
>   .../sysfs-devices-platform-_UDC_-gadget       |  10 +-
>   .../ABI/testing/sysfs-devices-platform-ipmi   |  52 ++--
>   .../ABI/testing/sysfs-devices-system-cpu      |   4 +-
>   .../ABI/testing/sysfs-driver-hid-lenovo       |  10 +
>   .../ABI/testing/sysfs-driver-hid-ntrig        |  13 +-
>   .../ABI/testing/sysfs-driver-hid-roccat-kone  |  19 ++
>   .../ABI/testing/sysfs-driver-hid-wiimote      |   1 +
>   .../ABI/testing/sysfs-driver-input-exc3000    |   2 +
>   .../ABI/testing/sysfs-driver-jz4780-efuse     |   6 +-
>   .../ABI/testing/sysfs-driver-pciback          |   6 +-
>   Documentation/ABI/testing/sysfs-driver-ufs    | 228 ++++++++++++++----
>   .../ABI/testing/sysfs-driver-w1_ds28e17       |   3 +
>   Documentation/ABI/testing/sysfs-firmware-acpi |  16 +-
>   .../ABI/testing/sysfs-firmware-efi-esrt       |  28 ++-
>   .../testing/sysfs-firmware-efi-runtime-map    |  14 +-
>   .../ABI/testing/sysfs-firmware-qemu_fw_cfg    |  20 +-
>   Documentation/ABI/testing/sysfs-firmware-sfi  |   6 +-
>   .../ABI/testing/sysfs-firmware-sgi_uv         |   6 +-
>   Documentation/ABI/testing/sysfs-fs-f2fs       |  48 ++--
>   Documentation/ABI/testing/sysfs-kernel-mm-ksm |   5 +-
>   Documentation/ABI/testing/sysfs-kernel-slab   |   3 +
>   Documentation/ABI/testing/sysfs-module        |  17 +-
>   .../ABI/testing/sysfs-platform-dell-laptop    |  10 +-
>   .../ABI/testing/sysfs-platform-dell-smbios    |   4 +-
>   .../testing/sysfs-platform-i2c-demux-pinctrl  |   4 +-
>   Documentation/ABI/testing/sysfs-platform-kim  |   1 +
>   .../testing/sysfs-platform-phy-rcar-gen3-usb2 |  10 +-
>   .../ABI/testing/sysfs-platform-renesas_usb3   |  10 +-
>   Documentation/ABI/testing/sysfs-power         |  21 +-
>   Documentation/ABI/testing/sysfs-profiling     |   2 +-
>   Documentation/ABI/testing/sysfs-wusb_cbaf     |   3 +-
>   Documentation/ABI/testing/usb-charger-uevent  |  82 ++++---
>   Documentation/ABI/testing/usb-uevent          |  32 +--
>   scripts/get_abi.pl                            |   2 -
>   126 files changed, 1323 insertions(+), 767 deletions(-)
>

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
