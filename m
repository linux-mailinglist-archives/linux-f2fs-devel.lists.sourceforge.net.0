Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAA7380BA6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 May 2021 16:19:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lhYeU-0006XL-2x; Fri, 14 May 2021 14:18:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1lhYeS-0006XB-Bq; Fri, 14 May 2021 14:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JF5Slj6dF7gdbGNetjVZX4KR543DWDdBx5JIXcYCrws=; b=ENNcRdGp/2e0N7a3tvEmvs4b0S
 UYNKOnS+QatagQXC35czonCpk7cfG7+0NwM+jgw+bdQtnZhaIxYhvjvdYNrxmFOZJruRoN+6fVeDa
 ykleXWabtB95+jgcQPPHlPkrpnN32yKOWCb0UP5lGHAlrUwK+T3UyzPJkvpHdwzFnjBU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JF5Slj6dF7gdbGNetjVZX4KR543DWDdBx5JIXcYCrws=; b=ETFNq0jybUQO5tswhmU6Dt9LcC
 1A42n8W1hmH362LABzmrtco8CmYiPHDtCBatbod1ceIva/dYJDmNsdu7lg3VsVhlrZgkECU/HzuX2
 YHjzjy8MJULTWfWv/jH4424dwdbMmeeHoH2yC3uvlBcPD7ugRGUi6PC4HJXlInEVXEVo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lhYeJ-008Joi-Ln; Fri, 14 May 2021 14:18:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C73C61408;
 Fri, 14 May 2021 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621001918;
 bh=c7dfcDSUedN/VQoQv/XM8fRZG2HhOOW57vq4i3XI37w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OQ+w8jq41p/pK8QPzt383K43rnWDvG9IebEZzoZj7WKu0EgpEM3a4OB9pZnDV5/lC
 MxVWpkmQpp2inFtKTGn6bM1fAR+gA+04aBXFsHrR34k+VM9wQUFTEenWCHNxw8mV5S
 Rr3kzMIGVT+KJ8CgQJfj5jt0KJvZQg0gfBfD7ImGjDrz6TXEWqjpD0nn1NC8t6bBSV
 Y2m7PBzQCXheFvsYF9jZqx3chr66nJXcElBiHfvACPcxjY0VNJoiSeft4M6sPjRp9i
 /15Ta8qfh6z3LjSIBpnNeZl0hFKEsFjvWWGKfF/qxDT0jcgdTLCyifuXI2D1S1QhIL
 whK9i7cORQs2g==
Date: Fri, 14 May 2021 16:18:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <20210514161825.4e4c0d3e@coco.lan>
In-Reply-To: <8b8bc929-2f07-049d-f24c-cb1f1d85bbaa@gmail.com>
References: <cover.1620823573.git.mchehab+huawei@kernel.org>
 <d2fed242fbe200706b8d23a53512f0311d900297.camel@infradead.org>
 <20210514102118.1b71bec3@coco.lan>
 <61c286b7afd6c4acf71418feee4eecca2e6c80c8.camel@infradead.org>
 <8b8bc929-2f07-049d-f24c-cb1f1d85bbaa@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sailingissues.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lhYeJ-008Joi-Ln
Subject: Re: [f2fs-dev] [PATCH v2 00/40] Use ASCII subset instead of UTF-8
 alternate symbols
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 keyrings@vger.kernel.org, linux-sgx@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 linux-acpi@vger.kernel.org, Mali DP Maintainers <malidp@foss.arm.com>,
 linux-input@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RW0gRnJpLCAxNCBNYXkgMjAyMSAxMjowODozNiArMDEwMApFZHdhcmQgQ3JlZSA8ZWNyZWUueGls
aW54QGdtYWlsLmNvbT4gZXNjcmV2ZXU6Cgo+IEZvciBhbnlvbmUgd2hvIGRvZXNuJ3Qga25vdyBh
Ym91dCBpdDogWCBoYXMgdGhpcyB3b25kZXJmdWwgdGhpbmcgY2FsbGVkCj4gIHRoZSBDb21wb3Nl
IGtleVsxXS4gIEZvciBpbnN0YW5jZSwgdHlwZSDijoQtLS0gdG8gZ2V0IOKAlCwgb3Ig4o6EPCIg
Zm9yIOKAnC4KPiBNdWNoIG1vcmUgbW5lbW9uaWMgdGhhbiBVbmljb2RlIGNvZGVwb2ludHM7IGFu
ZCB5b3UgY2FuIGV4dGVuZCBpdCB3aXRoCj4gIHVzZXItZGVmaW5lZCBzZXF1ZW5jZXMgaW4geW91
ciB+Ly5YQ29tcG9zZSBmaWxlLgoKR29vZCB0aXAuIEkgaGF2ZW4ndCB1c2UgY29tcG9zaXRlIGZv
ciB5ZWFycywgYXMgVVMtaW50bCB3aXRoIGRlYWQga2V5cyBpcwplbm91Z2ggZm9yIDk5Ljk5OSUg
b2YgbXkgbmVlZHMuIAoKQnR3LCBhdCBsZWFzdCBvbiBGZWRvcmEgd2l0aCBNYXRlLCBDb21wb3Np
dGUgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdC4gSXQgaGFzCnRvIGJlIGVuYWJsZWQgZmlyc3QgdXNp
bmcgdGhlIHNhbWUgdG9vbCB0aGF0IGFsbG93cyBjaGFuZ2luZyB0aGUgS2V5Ym9hcmQKbGF5b3V0
WzFdLgoKWWV0LCB0eXBpbmcgYW4gRU4gREFTSCBmb3IgZXhhbXBsZSwgd291bGQgYmUgIjxjb21w
b3NpdGU+LS0uIiwgd2l0aCBpcyA0CmtleXN0cm9rZXMgaW5zdGVhZCBvZiBqdXN0IHR3byAoJy0t
JykuIEl0IG1lYW5zIHR3aWNlIHRoZSBlZmZvcnQgOy0pCgpbMV0gS0RFLCBHTm9tZSwgTWF0ZSwg
Li4uIGhhdmUgZGlmZmVyZW50IHdheXMgdG8gZW5hYmxlIGl0IGFuZCB0byAKICAgIHNlbGVjdCB3
aGF0IGtleSB3b3VsZCBiZSBjb25zaWRlcmVkIDxjb21wb3NpdGU+OgoKCWh0dHBzOi8vZHJ5LnNh
aWxpbmdpc3N1ZXMuY29tL3VzLWludGVybmF0aW9uYWwta2V5Ym9hcmQtbGF5b3V0Lmh0bWwKCWh0
dHBzOi8vaGVscC51YnVudHUuY29tL2NvbW11bml0eS9Db21wb3NlS2V5CgpUaGFua3MsCk1hdXJv
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
