Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 097E4380829
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 May 2021 13:08:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lhVgZ-0006KI-28; Fri, 14 May 2021 11:08:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ecree.xilinx@gmail.com>)
 id 1lhVgW-0006K7-U5; Fri, 14 May 2021 11:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DnsDrIqkWnYf7da8HpIWFBQQt2XImu+6ZyHWBvjrfcE=; b=eSoKkMMrI0S4PA7izkEuwLFeKe
 DZJniFWggiEJZXSOJRtxOScFYOrhinjC1ovH6eCveNrEiSNdNrU8NPRBUw+YEMf4xUJWQaxfDoZz2
 g0cDqyEpkkoCH9huOP5nUCIG5n+wqrMtdidFgoQ4g/wk5S3AnctTV1HFg4P1PcKFE0jU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DnsDrIqkWnYf7da8HpIWFBQQt2XImu+6ZyHWBvjrfcE=; b=DBht9ekUs0rWhYUTzENm5Mon2/
 NoQrAfUogC4PHcUojcN3xyD2mImdHZQJ3wId/GpLeMxuXns62tWZrbLCTid5eq4ausq1Cn8Sj2/nv
 ptEFqiuvZMes9mLTxqN3kDms4JqwUN60nMosdPEDwqxTnnR4jLnzAoQ2Aag+P8T6x9rU=;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lhVgR-0003hw-Kw; Fri, 14 May 2021 11:08:48 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so1222427wmy.5; 
 Fri, 14 May 2021 04:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DnsDrIqkWnYf7da8HpIWFBQQt2XImu+6ZyHWBvjrfcE=;
 b=sDX/4vOZ59ic93Kj1k7EQHH5H75TwRxFQdfU97NsB2/Y+xVttZgCu6VcmdiZBbTXV4
 Yd9dS94Y1asR2VIYZN7NEerfwgmtEUFK3NZSUIzeY6J/4AmyVofgnwxiuO5puvulkCHX
 zAH+iCNJUU2yLFhQkplxklOlcyZUbrmQbTIThNq4BukYbZy9X610Bla24hpoPnMCKKtF
 HaX7GWwtAjZyjiNuvWcCoIBPkXTf9xY5aCFfjMGcrbRCdRoMLY/c+VX1+t1XGHSYNqtQ
 /vEAS8jymBn+QTD3oR/5dtU3nH62pPJpzKh6iPn38AjBb8Fr8EpkCArPsjTRrMSNZ8n3
 9CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DnsDrIqkWnYf7da8HpIWFBQQt2XImu+6ZyHWBvjrfcE=;
 b=cj1OSzLknqWPLU6Y5+ldEXyjD+evj0nEMvltFDZc+ishUJYXtDH1rBwetRopuUGXc7
 9h1Ij03CLS6LQ4ralghL7jYsuWqW6/Lg50uyBZpzpgURRldfNtngu8ExItMofi6O1N++
 tfYrQdOcHDD5jhudlpvvw0QXvvAlzMWg1sSNnRHA3UDpjAPMwJOiJuKfbx/FfNqoEflh
 HNmXqmwwdNSzx5PoQ2NB1+ZRjwnG5OZ+RhtOZbmj88ZO8tY6MGX/SrCcnYMTpn8EpubO
 AbJ6XXtA5W4O5aJ9Sdpnjaw6Yr2SE17joKmYfrVuTj4/DOqOPEB3MXmfyLxoAr4UnSKT
 cgYg==
X-Gm-Message-State: AOAM530X02CQYLe7CGJfy0SEVUf9kS2CwdPAQkUFbWPc/+4K8CckV3O1
 JIcYcGI6nZ/9G4PdbR8ks0aKq99qE6g2Nw==
X-Google-Smtp-Source: ABdhPJwViz0BDPUuVH349RqXP0p4zCVFhrVjXNorTYnm55dAjMiaqH0FajvtM+sJwCYcinjBh5k1qQ==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr21007074wmb.113.1620990517974; 
 Fri, 14 May 2021 04:08:37 -0700 (PDT)
Received: from [192.168.1.122]
 (cpc159425-cmbg20-2-0-cust403.5-4.cable.virginm.net. [86.7.189.148])
 by smtp.gmail.com with ESMTPSA id b10sm7116349wrr.27.2021.05.14.04.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 04:08:37 -0700 (PDT)
To: David Woodhouse <dwmw2@infradead.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <cover.1620823573.git.mchehab+huawei@kernel.org>
 <d2fed242fbe200706b8d23a53512f0311d900297.camel@infradead.org>
 <20210514102118.1b71bec3@coco.lan>
 <61c286b7afd6c4acf71418feee4eecca2e6c80c8.camel@infradead.org>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <8b8bc929-2f07-049d-f24c-cb1f1d85bbaa@gmail.com>
Date: Fri, 14 May 2021 12:08:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <61c286b7afd6c4acf71418feee4eecca2e6c80c8.camel@infradead.org>
Content-Language: en-GB
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wikipedia.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.44 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (ecree.xilinx[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.44 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lhVgR-0003hw-Kw
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
 linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBPbiBGcmksIDIwMjEtMDUtMTQgYXQgMTA6MjEgKzAyMDAsIE1hdXJvIENhcnZhbGhvIENoZWhh
YiB3cm90ZToKPj4gSSBkbyB1c2UgYSBsb3Qgb2YgVVRGLTggaGVyZSwgYXMgSSB0eXBlIHRleHRz
IGluIFBvcnR1Z3Vlc2UsIGJ1dCBJIHJlbHkKPj4gb24gdGhlIFVTLWludGwga2V5Ym9hcmQgc2V0
dGluZ3MsIHRoYXQgYWxsb3cgbWUgdG8gdHlwZSBhcyAiJ2EiIGZvciDDoS4KPj4gSG93ZXZlciwg
dGhlcmUncyBubyBzaG9ydGN1dCBmb3Igbm9uLUxhdGluIFVURi1jb2RlcywgYXMgZmFyIGFzIEkg
a25vdy4KPj4KPj4gU28sIGlmIHdvdWxkIG5lZWQgdG8gdHlwZSBhIGN1cmx5IGNvbW1hIG9uIHRo
ZSB0ZXh0IGVkaXRvcnMgSSBub3JtYWxseSAKPj4gdXNlIGZvciBkZXZlbG9wbWVudCAodmltLCBu
YW5vLCBrYXRlKSwgSSB3b3VsZCBuZWVkIHRvIGN1dC1hbmQtcGFzdGUKPj4gaXQgZnJvbSBzb21l
d2hlcmUKCkZvciBhbnlvbmUgd2hvIGRvZXNuJ3Qga25vdyBhYm91dCBpdDogWCBoYXMgdGhpcyB3
b25kZXJmdWwgdGhpbmcgY2FsbGVkCiB0aGUgQ29tcG9zZSBrZXlbMV0uICBGb3IgaW5zdGFuY2Us
IHR5cGUg4o6ELS0tIHRvIGdldCDigJQsIG9yIOKOhDwiIGZvciDigJwuCk11Y2ggbW9yZSBtbmVt
b25pYyB0aGFuIFVuaWNvZGUgY29kZXBvaW50czsgYW5kIHlvdSBjYW4gZXh0ZW5kIGl0IHdpdGgK
IHVzZXItZGVmaW5lZCBzZXF1ZW5jZXMgaW4geW91ciB+Ly5YQ29tcG9zZSBmaWxlLgooSSBhc3N1
bWUgV2F5bGFuZCBzdXBwb3J0cyBhbGwgdGhpcyB0b28sIGJ1dCBkb24ndCBrbm93IHRoZSBkZXRh
aWxzLikKCk9uIDE0LzA1LzIwMjEgMTA6MDYsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPiBBZ2Fp
biwgaWYgeW91IHdhbnQgdG8gbWFrZSBzcGVjaWZpYyBmaXhlcyBsaWtlIHJlbW92aW5nIG5vbi1i
cmVha2luZwo+IHNwYWNlcyBhbmQgYnl0ZSBvcmRlciBtYXJrcywgd2l0aCBzcGVjaWZpYyByZWFz
b25zLCB0aGVuIHRob3NlIG1ha2UKPiBzZW5zZS4gQnV0IGl0J3MgZ290IHZlcnkgbGl0dGxlIHRv
IGRvIHdpdGggVVRGLTggYW5kIGhvdyBlYXN5IGl0IGlzIHRvCj4gdHlwZSB0aGVtLiBBbmQgdGhl
IGV4Y3VzZSB5b3UndmUgcHV0IGluIHRoZSBjb21taXQgY29tbWVudCBmb3IgeW91cgo+IHBhdGNo
ZXMgaXMgdXR0ZXJseSBib2d1cy4KCisxCgotZWQKClsxXSBodHRwczovL2VuLndpa2lwZWRpYS5v
cmcvd2lraS9Db21wb3NlX2tleQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
