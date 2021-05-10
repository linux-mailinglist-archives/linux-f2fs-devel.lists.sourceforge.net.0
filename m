Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D0B37870F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 13:33:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg49z-0003T2-SQ; Mon, 10 May 2021 11:33:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <linux@leemhuis.info>)
 id 1lg49x-0003Sr-5n; Mon, 10 May 2021 11:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GWicXhhP8t7jOGZurHjueOJK1QYxQW5khYIthm1fU+w=; b=MRcUZCnNyFxtS9K2Wq7XA5Z6yA
 rdBt64rECA8fxKAjyRw+6/hZYGg/aqQND98nH7dPtyxwxPi6Mrqj86xvSqa8mmks3RB3X2vLWfqZr
 eo+thjTf2P7SienOYF16Z2kGzJESoHEyd9OTVVbDKfVp/5n9JbInefCaRx0fYUuudOmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GWicXhhP8t7jOGZurHjueOJK1QYxQW5khYIthm1fU+w=; b=Z86IzcjXVLS9xHiCgtk244ZhAo
 4NzMzdtc7qn5Y2Ox21MhUB7rRQfQEXaaFDuUNXNLB96n2OfwNys2o0TqhdNkBWUAJbmHrwMVhCzlg
 qYIhm1X9JZIduXf9CQcPJ+BRq63XPHGix74DgayZwWqMsnxTGmMTrCRLCkAbk+jSnBVg=;
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lg49n-00017l-UM; Mon, 10 May 2021 11:33:13 +0000
Received: from ip4d14bd53.dynamic.kabel-deutschland.de ([77.20.189.83]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1lg3Wn-0008EG-Lc; Mon, 10 May 2021 12:52:45 +0200
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
From: Thorsten Leemhuis <linux@leemhuis.info>
Message-ID: <c4479ced-f4d8-1a1e-ee54-9abc55344187@leemhuis.info>
Date: Mon, 10 May 2021 12:52:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
Content-Language: en-BS
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1620646384;49b78ac8;
X-HE-SMSGID: 1lg3Wn-0008EG-Lc
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [80.237.130.52 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lg49n-00017l-UM
Subject: Re: [f2fs-dev] [PATCH 00/53] Get rid of UTF-8 chars that can be
 mapped as ASCII
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDEwLjA1LjIxIDEyOjI2LCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6Cj4KPiBBcyBM
aW51eCBkZXZlbG9wZXJzIGFyZSBhbGwgYXJvdW5kIHRoZSBnbG9iZSwgYW5kIG5vdCBldmVyeWJv
ZHkgaGFzIFVURi04Cj4gYXMgdGhlaXIgZGVmYXVsdCBjaGFyc2V0LCBiZXR0ZXIgdG8gdXNlIFVU
Ri04IG9ubHkgb24gY2FzZXMgd2hlcmUgaXQgaXMgcmVhbGx5Cj4gbmVlZGVkLgo+IFvigKZdCj4g
VGhlIHJlbWFpbmluZyBwYXRjaGVzIG9uIHNlcmllcyBhZGRyZXNzIHN1Y2ggY2FzZXMgb24gKi5y
c3QgZmlsZXMgYW5kIAo+IGluc2lkZSB0aGUgRG9jdW1lbnRhdGlvbi9BQkksIHVzaW5nIHRoaXMg
cGVybCBtYXAgdGFibGUgaW4gb3JkZXIgdG8gZG8gdGhlCj4gY2hhcnNldCBjb252ZXJzaW9uOgo+
IAo+IG15ICVjaGFyX21hcCA9ICgKPiBb4oCmXQo+IAkweDIwMTMgPT4gJy0nLAkJIyBFTiBEQVNI
Cj4gCTB4MjAxNCA9PiAnLScsCQkjIEVNIERBU0gKCkkgbWlnaHQgYmUgcGVyZm9ybWluZyBiaWtl
IHNoZWRkaW5nIGhlcmUsIGJ1dCB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8KcmVwbGFjZSB0aG9z
ZSB0d28gd2l0aCAiLS0iLCBhcyBleHBsYWluZWQgaW4KaHR0cHM6Ly9lbi53aWtpcGVkaWEub3Jn
L3dpa2kvRGFzaCNBcHByb3hpbWF0aW5nX3RoZV9lbV9kYXNoX3dpdGhfdHdvX29yX3RocmVlX2h5
cGhlbnMKCkZvciBFTSBEQVNIIHRoZXJlIHNlZW1zIHRvIGJlIGV2ZW4gIi0tLSIsIGJ1dCBJJ2Qg
c2F5IHRoYXQgaXMgYSBiaXQgdG9vCm11Y2guCgpPciBkbyB5b3UgZmVhciB0aGUgZXh0cmEgd29y
ayBhcyBzb21lIGxpbmVzIHRoZW4gbWlnaHQgYnJlYWsgdGhlCjgwLWNoYXJhY3RlciBsaW1pdCB0
aGVuPwoKQ2lhbywgVGhvcnN0ZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
