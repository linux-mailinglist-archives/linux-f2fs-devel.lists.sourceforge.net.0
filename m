Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F02A2A11B3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Oct 2020 00:38:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYdyr-0002Z1-63; Fri, 30 Oct 2020 23:38:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peter.chen@nxp.com>) id 1kYdyp-0002Yk-9w
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 23:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vhj8bR0FEYSQLe26u0naRbFfDHrX8s0dwrX3QaS7wGs=; b=OQGAf/pDiChQg1R7cwBqOwy8cG
 QkZer7ITvQ0SqzKfjjlT25D7yOwKbF9bmoopxa0j+YwVXqJZKTR5iCP3ZSuxP/2Y8QkuDYCLBA1Lk
 lX6lJWTbR9cqq/muiWWcDdHNJd/bRWk9lljBkg4e1dcNQ5KRoV1HS8nMjHtLzQjfrYHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vhj8bR0FEYSQLe26u0naRbFfDHrX8s0dwrX3QaS7wGs=; b=bPTQypbrJd81TOPatbgjzAZ/7f
 1YOCRZX4JTeWoDJkNOHZDWMPOGfiZ/g/b705WfeJPzyMHpREzzBRDBOhDXLOvbF1LFynWKeuqXXLS
 2FQWtlSTm2Ft/yzIJ2DM17bBLU0sVyVr14vHDEdot0PGOPgi3zMWhT+lIgrZPrQBic2Y=;
Received: from mail-am6eur05on2061.outbound.protection.outlook.com
 ([40.107.22.61] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kYdyh-003F4a-7a
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 23:38:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O72TZe+b4fHEENL9RgHrteipUNZQ4AgyaPc8u5OGEZ1uWMDlc0/fVuXqtDM3zSOkahATKhmaeE2W1HPh/6QzXxOMKafzWHnXDWEZGfWVkVgSJ5m2dk+/qsKKJ0fOUa+LMLjWSIhubK0vkcBl1XfgdLxFOVdgclA3atuJrjC7g5YOvXAj1yloRqIDxWWADAwL5kVs2HJo4mCQEGhmQKcISNfTj71ps5O/2enMvn3d/e4NcG2xOxR507lMU+4zst0UX8j+1+EAGFrYHsg2WDRWznCRv2yzEgWWjvqBr5CK3OBTmpg4Xpqn0hZ5lHwQr+yVxmSYewjitzwg5c6XP0Zkng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vhj8bR0FEYSQLe26u0naRbFfDHrX8s0dwrX3QaS7wGs=;
 b=jzpzll8g7Py1H/O4i1lHoukCTQ5E+caFHmSg9BwjkY7sTnEUZMNoyIi3R22uszHJzXjUD4qCHkDu7wfA7NE8TLSSiI96p4F5nrFTN5m3Xw8cxVRr6krFwZa7kvbvrGzwL2Trni5nPGUiiZlcQZJTrB4b3axvO24i7AFWid3E6PaLld6EqPGB4b/KNg9l6Z5pgiIs5oJv6gv5+yXC6M4r8rVK2NhlQX3w4xRYc19QJHItPv2WJ4PAngO6XruN8zAHRFOxP0YTvfNbfCJAEWQM06gIRAddCxguSSMJxovmOVHYeh1aXApkSkeur1pZAfG3oXAyjefM33VVmub1yGpIIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vhj8bR0FEYSQLe26u0naRbFfDHrX8s0dwrX3QaS7wGs=;
 b=b6byclA7ptlazZI8GuuWgH8I8ZqLwy6whn2pyx0KnJRnU1QeJ4D3aPRf1h8EICWf4GVe10kwX/wKaQuPchI90gi6NwN5zMEx2C6QgQL/WT+QitQt4gfCNo8gMlpZhMWy2HezwALezW+iTPQAyJE4biKPGbB7ZD2p4vpQUJZCfCg=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR0402MB3364.eurprd04.prod.outlook.com (2603:10a6:208:17::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Fri, 30 Oct
 2020 23:23:48 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 23:23:48 +0000
From: Peter Chen <peter.chen@nxp.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
Thread-Topic: [PATCH v2 31/39] docs: ABI: cleanup several ABI documents
Thread-Index: AQHWrpAP/5fyi5IMO0mg3rPCeBI8xamwyZ5A
Date: Fri, 30 Oct 2020 23:23:48 +0000
Message-ID: <AM8PR04MB73004CAA0D31628FD8E0A7878B150@AM8PR04MB7300.eurprd04.prod.outlook.com>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
In-Reply-To: <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [222.65.215.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ab56f412-7e05-43a2-c8a2-08d87d2adaf8
x-ms-traffictypediagnostic: AM0PR0402MB3364:
x-microsoft-antispam-prvs: <AM0PR0402MB3364418B792F35188BB317EC8B150@AM0PR0402MB3364.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6cFTuXK2Z9T7IjE5nPSWOSW0H399lElCPFWNLu6mHH4GG8v3HOSeMavESO4H4I9gowW5Afs8cqovZdsdk4diWdRNgTMHQYwDH1gIcaeh79GVjuaHKoAYOp3+UqMXYEwxQUjNdknu4G2opTbyTt5NGMl3eveYDFQ1g+yALBS2JXjYDgu4OTZDsAdNins5Z9iDdhCsUh0n0Ac2pzEW3Phd67aVAH58rexxKss/OEMy3djmxSUwQ9eE4OVx9tAi4dePxA3E9MEfzHQJw/slZ/Ty7x+f7PPl2UIexlQS7zANo59gM4rJc6WFgnp+Rv6XZzIwB/1/1oMSKbmZPfGlnXqUqg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7300.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(66446008)(64756008)(66556008)(66476007)(66946007)(8676002)(8936002)(26005)(76116006)(33656002)(9686003)(558084003)(2906002)(6506007)(86362001)(71200400001)(4270600006)(7366002)(7416002)(7276002)(7336002)(7406005)(55016002)(478600001)(44832011)(316002)(4326008)(7696005)(52536014)(54906003)(110136005)(186003)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: LmyEy8+AlZr0dH3UtrHGN0gD8GkdEEPWI6n0X0Rk9JUl98O2+sB6+ZwOqVeIHcBYcxrKBjxFhjCb8dqfdB/GiKbLBrA0yyNdIPWoaTbTwIsLEJ1DBRVPEmlTd0blnrcQx9YbXzGI8eyhzke/H8OTBO8bY+bql8ELMv1wkrZDm9dzENVDiUbtBX3wGEYJYG+bR31awYvDh9k6VGUIH/Su5TWldhdNDcKPXkVmWmEM5d0sA1jF3QTyzY988DJJR6tJME+CvU93PQruGK+n3wrUZcn5HsmXC5AHnv3gFK+mMmGJRkDvfOtHItzNPyLoxDHdtbOd4hBKu9Eb6rw5XJ/PpWTH9gNj2Q2CaloNw7FWZfRwJ1nvMg/iUFq+eRpwELo1IANZ/LbdrOw/dIvuKtzdPbLUKTlyUm4qOqJjYqDF/OJ+LuAGU+BiWOBseSX7crvpQWuinc5ZbXMMgn1dkD/01Xls89DDDRP7Iw1ciEB4Im/5vXLnyyySSOlgIAQayat+uTuzaoD3U6VWZ3Kk8LLN5AeIKfYe5W6q7eUbyqOl1eeCC03y1tBciW6p5XccP84xOHvRLzjPponAsdRrafe1wbkM0cZhg0BrYnwpUtwg8KWqJ85Mk1ba56CTOL8R6NfE4LQ7lQBUVRpnNQl92xjpng==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab56f412-7e05-43a2-c8a2-08d87d2adaf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 23:23:48.6948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8UMbaQT8WSLKAWQn2nnLbTWgleWz5CJPLtzNg9ghlA+i2S0NB1XdlA7k+9UyIpcqSYEp8v3iM7Y8S+CVX+++sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3364
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: nxp.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [40.107.22.61 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.22.61 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kYdyh-003F4a-7a
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
Cc: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>,
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
 Stefan Achatz <erazor_de@users.sourceforge.net>,
 Konstantin Khlebnikov <koct9i@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Wu Hao <hao.wu@intel.com>,
 Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Hanjun Guo <guohanjun@huawei.com>, Oleh Kravchenko <oleg@kaa.org.ua>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Saravana Kannan <saravanak@google.com>, Anton Vorontsov <anton@enomsg.org>,
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
 Oded Gabbay <oded.gabbay@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jarkko Sakkinen <jarkko@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>,
 "linux-fpga@vger.kernel.org" <linux-fpga@vger.kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jonas Meurer <jonas@freesources.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Mark Gross <mgross@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Ilya Dryomov <idryomov@gmail.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, Kees Cook <keescook@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Kranthi Kuntala <kranthi.kuntala@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Colin Cross <ccross@android.com>,
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
 Mike Leach <mike.leach@linaro.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Kajol Jain <kjain@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 Andreas Klinger <ak@it-klinger.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Asutosh Das <asutoshd@codeaurora.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Acked-by: Peter Chen <peter.chen@nxp.com> 

For:
Documentation/ABI/testing/usb-charger-uevent

Peter

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
