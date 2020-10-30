Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5132A03C5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Oct 2020 12:12:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYSKR-0004v5-IB; Fri, 30 Oct 2020 11:12:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <idryomov@gmail.com>) id 1kYSKQ-0004uy-L0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 11:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZV0ThIiPZfP1J2R9nyVt8QkuejC8cSVT80sCSgcOxz0=; b=ZnjSSCB0G1HdfJpboS5TfJ/YqV
 TIuJvBBQKmJPAmI3Emy88RPqugTLGescgScX2SqEymVKr9Klhh9hb6Tm3GBDb8QI7Jk1HI/mg/t7O
 RcKkH5JnBFzIQAQPKQJ+WL+q4Z8WCT1gtKmGTehXdGLYJ0UnoUQIfU1XvoCsMz+Qbsm4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZV0ThIiPZfP1J2R9nyVt8QkuejC8cSVT80sCSgcOxz0=; b=d/AfaRzfACzDvr9g/J32X0cTad
 tAUdehXUM2oVdc/XSgzXJucrdK+yfZSW+T5p5rm97ycpw1bSdKKnt8TFwfAMS+Vy1UBFlSYhe+cnf
 Z0gYrZUvknY5Xbyu+r/uBjdyOXqrbvv9GZ9wkxmh9lu5gSjHQuXJwjkFwhEMB+UuM5qA=;
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kYSKG-00Cqt0-1z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 11:12:18 +0000
Received: by mail-il1-f194.google.com with SMTP id x7so6147938ili.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Oct 2020 04:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZV0ThIiPZfP1J2R9nyVt8QkuejC8cSVT80sCSgcOxz0=;
 b=frLzaxmwhGcVkXjbtKiS94LkaEgTCIqs5lcLgp7qud2oXWRlC0QKI3bu8As+Qe/3+/
 YswYlbhwudFEROgXLO0RidFvUATOBI7jk1lDLjY+whOmmq9Wr466RzZ5uuDqGV3FbAQG
 l5ts/Dwn0MzkC2R6n6o7hulkK9e/L4r9462cvEbQnmU+Vp4izCFhUSz5rYUeyvvecom/
 skR+qlhyOuiRDMt/6fAEhtpRAkvua7TqwnEmsCShc8NHMqgmHLM3NnLpiiyehNei+OWa
 WZsv0NfFfxPPWvhOiranGCdFjTSZKT7qkP3ITLJ8wRX/70+d0XR4v07v323ob3Nx/pYz
 m4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZV0ThIiPZfP1J2R9nyVt8QkuejC8cSVT80sCSgcOxz0=;
 b=UvbE4tif9vYwovuZuNLYPasq85f9DXlZqQTmpC2WVpcUFSnv6/9W8r2+QG3uqvLIqX
 j/0X67ar7ctC2Xf3+hFCshkmFHoG9bBR+R75qrfFOZzd4Viq1P034VpRnNxnn4YmGOOp
 t8Fnx08MexITU+tA6TZwpHo+LI3KE51YZhaLLSeG9QuH3G8phTAg7PRvxLM5vRWAd+IM
 ov6bI/08VsY+9K01g+zxG52M1Ps1v4iD0R/67/k6QuKnAz0xmhHWOlL0d53YxHROmClm
 J4Q9t+kf5EeEY+NgdKfPAPDV0G+u5be0sIO6DWXB7q/M2QFIyJ7HxSaKbQdRXOzbUTHy
 +8Mw==
X-Gm-Message-State: AOAM533dIGdlXUmddMUugV1VXd9x0IMgQMgYgId5x1DVLUvA9gUIie2u
 XGLgE8pzFAQirr54V0DG+s/+cQX6ueiz1anxk/w=
X-Google-Smtp-Source: ABdhPJzTddVFvGcRMfdnfgtj3RhHYeI8lzSbPQsDbDZuu+e8Z0f5KxtsaoxhCUlFTZHA3Ubj6PmYhDwWjpnLL1nJZe4=
X-Received: by 2002:a92:4442:: with SMTP id a2mr1368452ilm.220.1604056315371; 
 Fri, 30 Oct 2020 04:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
In-Reply-To: <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 30 Oct 2020 12:11:54 +0100
Message-ID: <CAOi1vP-gKLw7shFy5rUeH6Z14hr_B9fW0epaRyuw45tg4EuCcQ@mail.gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (idryomov[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kYSKG-00Cqt0-1z
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
 Ceph Development <ceph-devel@vger.kernel.org>,
 Bart Van Assche <bvanassche@acm.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-acpi@vger.kernel.org, Danil Kipnis <danil.kipnis@cloud.ionos.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Guenter Roeck <linux@roeck-us.net>, Ohad Ben-Cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org,
 Alexander Antonov <alexander.antonov@linux.intel.com>,
 Dan Murphy <dmurphy@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Achatz <erazor_de@users.sourceforge.net>,
 Konstantin Khlebnikov <koct9i@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
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
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 linux-media@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Oded Gabbay <oded.gabbay@gmail.com>,
 Tony Luck <tony.luck@intel.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
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
 Jonathan Corbet <corbet@lwn.net>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Kees Cook <keescook@chromium.org>, Dan Williams <dan.j.williams@intel.com>,
 Kranthi Kuntala <kranthi.kuntala@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Roman Sudarikov <roman.sudarikov@linux.intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-i3c@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Kajol Jain <kjain@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 Andreas Klinger <ak@it-klinger.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 netdev <netdev@vger.kernel.org>, linux-iio@vger.kernel.org,
 Asutosh Das <asutoshd@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Oct 30, 2020 at 8:41 AM Mauro Carvalho Chehab
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
>
> [...]
>
>  Documentation/ABI/testing/sysfs-bus-rbd       |  37 ++-

Acked-by: Ilya Dryomov <idryomov@gmail.com> # for rbd

Thanks,

                Ilya


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
