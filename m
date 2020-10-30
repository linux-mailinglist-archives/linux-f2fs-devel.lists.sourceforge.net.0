Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0962A0C14
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Oct 2020 18:06:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYXqn-00051E-Rv; Fri, 30 Oct 2020 17:06:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mathieu.poirier@linaro.org>) id 1kYXqm-000517-Sq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 17:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NZmqGfCg08N6iXx9q7TVWlSnhQqIDOwOjzOwbvXDxjI=; b=atubWMq6kzsZ7sVAYOKpsIj6xA
 9VfwAQNMa1y5EP/MO/Ene1iEle2Q+IzRnhiSvFc86grPKDPaNB44qK4k3TXiN1c8Vb99Ro4ryufBM
 BD4Lezh95i2uQskiXDEsumMSCugP1mxtBfzD27S3CyR4SELvzVK8ao7WOo+4curb17vo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NZmqGfCg08N6iXx9q7TVWlSnhQqIDOwOjzOwbvXDxjI=; b=MF6O8psl6U6kMCbHGwB4ODRw1Y
 Gci3K7k/KmYm+mCNLPaytOxMRPNt3/rfwiagHxpKsxBiuOkPsAZSgZsSr6Vw0UFLARwbvmtfn7Lry
 /tQ0LfyaqicF4+D8Lyjh3tBIP0ArunmaLwoBiUBBjOwBYnPdvJEQSbVfMy7qJPUc1mJY=;
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kYXqg-00DD1P-Km
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 17:06:04 +0000
Received: by mail-il1-f193.google.com with SMTP id z2so7063598ilh.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Oct 2020 10:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NZmqGfCg08N6iXx9q7TVWlSnhQqIDOwOjzOwbvXDxjI=;
 b=INVfZz/fkvsZivy8jdRFY4jjuumPUnT03fIMmAZxhr2j3OQtTxmqWeMui9FFLMvZFz
 QB2ePhBsJkuNysGjMHbU9DiLLxlLmss4JFzjBmUNAkJoiiGzYBFH/upOKm0AUQMizu+W
 okAB9PgkVOM5lyq7RfM3eZWziu4Lw6xFmIPsA3WEdWrepzCLkMsPGFysW4PIdG4Ix46W
 ABDHiqA089OjzR7YGXqWWnY73UPmGi5ssu5dObic6I8EipSHtDNSFTIEabkYZFtOUw53
 gKZFvyCe8mIA4cQPQ5Ji/NguzzOPrnGBpJ5jXdtWnz2BLO+k8PETRjkg1JznRZelvTOY
 uyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZmqGfCg08N6iXx9q7TVWlSnhQqIDOwOjzOwbvXDxjI=;
 b=Zu75dHA8U1GYAaEg2qokDpM5EgOknRaJD12q3RfN0Nqe/SNmZu6w86JKeKDjAYJdSe
 +PM3x4+RsvKiYD6sl+jqHtwADmAtIRBkPvyoRP3WqxSmxpExlDIzMB+zssO9wFQKJE9i
 ygQfJbtd02LapVbSMtgR0kTeAW3zjn39XbylHZK+In1j6I2VBA1mzFUExOCg44JboiVG
 bTlaKVjLfQQBz3JwSLZauOZCHUfiqcA0HJa7tlu9taal2p/qxiLAA6j9UFGymxTlsO7D
 a5ir3B2y8OkIKfPP40S99U/gTUJuNsypl9q/wA48qtCtUpN6v0I9QB/FDtrRUdedAOi8
 J8Zw==
X-Gm-Message-State: AOAM530t+97VrEiBkRmUxZeLKlZ4udn7peSM5dj3pSYZmVmo8D2HrvW3
 3B0Px0q96DllxorW/3Y8cT0M7PHomrhiqbrecjniYqou9MyeyA==
X-Google-Smtp-Source: ABdhPJwYf7SWuKIRh8xsBOBodbVLmuU+KCM1QaVpZsez95JZOYKTbDYung3PLxm+lfmttII+vBXdnzsUUs8NHjrseg0=
X-Received: by 2002:a92:6403:: with SMTP id y3mr2528711ilb.72.1604076184121;
 Fri, 30 Oct 2020 09:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
In-Reply-To: <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 30 Oct 2020 10:42:53 -0600
Message-ID: <CANLsYkxc2uzA57Hg5OX31JOx08JCZfynzebjABv=6H01796xGA@mail.gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kYXqg-00DD1P-Km
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
 Jerry Snitselaar <jsnitsel@redhat.com>, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, Christian Gromm <christian.gromm@microchip.com>,
 ceph-devel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org,
 Danil Kipnis <danil.kipnis@cloud.ionos.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Guenter Roeck <linux@roeck-us.net>, Ohad Ben-Cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org,
 Alexander Antonov <alexander.antonov@linux.intel.com>,
 Dan Murphy <dmurphy@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Achatz <erazor_de@users.sourceforge.net>,
 Konstantin Khlebnikov <koct9i@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Wu Hao <hao.wu@intel.com>,
 Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Hanjun Guo <guohanjun@huawei.com>, Oleh Kravchenko <oleg@kaa.org.ua>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Saravana Kannan <saravanak@google.com>, Anton Vorontsov <anton@enomsg.org>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Len Brown <lenb@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Coresight ML <coresight@lists.linaro.org>, linux-media@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Oded Gabbay <oded.gabbay@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
 linux-gpio@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
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
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-i3c@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, Russell King <linux@armlinux.org.uk>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Kajol Jain <kjain@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 Andreas Klinger <ak@it-klinger.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, linux-iio@vger.kernel.org,
 Asutosh Das <asutoshd@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 30 Oct 2020 at 01:41, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
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

>  .../testing/sysfs-bus-coresight-devices-etb10 |   5 +-

For the CoreSight part:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
