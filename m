Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAEC1C0E7E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 May 2020 09:11:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jUPp5-0002YG-0D; Fri, 01 May 2020 07:10:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoqing.jiang@cloud.ionos.com>) id 1jUPp3-0002Y1-LO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 May 2020 07:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yXj2pdVP6i0fMstqZTjDinycQd6wkFMj6gwQt+noc8s=; b=LOLEg4RbOf4PAITOBFp3HQfuQc
 0Nmtq4I8y+we3XdZY54fdtZcX0PrdV7kmjoZI9NggDDfPlc19XzlUstqBKidkDTv26SnIqu4ZXdle
 PLHCREk31IAXOEtsWe7aIaWJyUOI3dklarmNKIESvCA1Qh4LtvdFHXqZnUS5oXzU7FXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yXj2pdVP6i0fMstqZTjDinycQd6wkFMj6gwQt+noc8s=; b=EeeF/4HG3TLtsRuXnC2SVbHo/S
 ydtqNTli+YBCqdxbzjyhHv+z2suyEh5trqV4VC7wZ0NW70LndZrbOmYA8anKXJWVya+vREuQHhjBX
 0PZ+CUAUNCKZBd0jsOz/UZ/37MkoBaX8oiO4MaAlFpS6tNHm5we0Ls2o9CVvuN8lqymA=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUPp1-006Lzj-RK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 May 2020 07:10:57 +0000
Received: by mail-lj1-f194.google.com with SMTP id w20so1915180ljj.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 May 2020 00:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=yXj2pdVP6i0fMstqZTjDinycQd6wkFMj6gwQt+noc8s=;
 b=igdtu79luKbp0ncnMlpcPUIFNLj09t5tdmXwPOynxALpGplpYNsCsKZ3TMVWdo9ixy
 9qcOgMNngF70aGp/iq6J334SDsCf0WvF+bfW4ShsvDr629zl7TV4YC0prPgNyXbEyMlW
 M1MwzmBX6wDzWgAHYgOPvyB2hfLG8XFlbXCydufpud/SGQ7MyIDh9SGccBouiyk8JPOD
 omSXRwL5PxUpdYANBC8EaED7ZmqMAkT/hWOPDTwnPPbIIdyI/RNn8FsVhdOgRXUne/0n
 FwcvzYyQzXR4siAZrRLlP9gvSaclMgDv8B/Qn8UpHmV/KeKMdWJCewHZdztoi6lv5/pf
 x8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yXj2pdVP6i0fMstqZTjDinycQd6wkFMj6gwQt+noc8s=;
 b=GreHSrkARTkGhljQVIycA9IEyjM5+8gBf8dQkHbQlYPaR6qmYuiTpGTG4b+j+Vd+ZD
 vTKGt5zqGnNlBcpXzq08feRGyJDCrjVTiWmimvgm2XHAfHjcdg/WD5Ao3PEvAf6sh3Ly
 VyVF279VvlhT6DmEVZhTBR7KJoujl0Saa3DGxyH3VFXo78WYMXlsTBioo0iEXNawVV25
 iuyJR04jbyN34gkmxlJVmg3UUBdGQw6f7A/Q6c5/42KyJAQCKYCYWLAt+KejfxNxzu9P
 dZLxGUQ97mlF0P5xTr+DND7BkKPAL6YguXpgbNgeFP21m+mQmAPdumA4bRnKaR/7WXbR
 kB7g==
X-Gm-Message-State: AGi0PuZVupzgfzQD5ydBeBm4rpzzsvVfkFYgKd+eFjgWWAfnUNwwdDod
 Acc2R2JYVwX1vuxDd9E83GXv5FpahIOLuYWa
X-Google-Smtp-Source: APiQypLtkGYIGGJq5BI6MtIPNjHZ3SCz/+s0PPQHI2w9oHJ8euTDIGJUWlFRjsunZB9rB6pxQ8UjcA==
X-Received: by 2002:a7b:cdf7:: with SMTP id p23mr2451834wmj.33.1588315091678; 
 Thu, 30 Apr 2020 23:38:11 -0700 (PDT)
Received: from ?IPv6:2001:16b8:48db:9b00:e80e:f5df:f780:7d57?
 ([2001:16b8:48db:9b00:e80e:f5df:f780:7d57])
 by smtp.gmail.com with ESMTPSA id x13sm2886685wmc.5.2020.04.30.23.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 23:38:11 -0700 (PDT)
To: =?UTF-8?Q?Andreas_Gr=c3=bcnbacher?= <andreas.gruenbacher@gmail.com>
References: <20200430214450.10662-1-guoqing.jiang@cloud.ionos.com>
 <20200430214450.10662-2-guoqing.jiang@cloud.ionos.com>
 <CAHpGcMKdzSBGZTRwuoBTuCFUX44egmutvCr9LcjYW7KpWxmhHA@mail.gmail.com>
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <05178e19-8971-0f3d-69de-5542fcb6a2a8@cloud.ionos.com>
Date: Fri, 1 May 2020 08:38:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHpGcMKdzSBGZTRwuoBTuCFUX44egmutvCr9LcjYW7KpWxmhHA@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: tuxera.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUPp1-006Lzj-RK
Subject: Re: [f2fs-dev] [RFC PATCH V2 1/9] include/linux/pagemap.h:
 introduce attach/clear_page_private
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Dave Chinner <david@fromorbit.com>, Song Liu <song@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>, Mike Marshall <hubcap@omnibond.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Chris Mason <clm@fb.com>,
 willy@infradead.org, Christoph Hellwig <hch@infradead.org>,
 devel@lists.orangefs.org, Josef Bacik <josef@toxicpanda.com>,
 linux-raid@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anton Altaparmakov <anton@tuxera.com>,
 Andreas Dilger <adilger@dilger.ca>, Yang Shi <yang.shi@linux.alibaba.com>,
 William Kucharski <william.kucharski@oracle.com>,
 linux-ntfs-dev@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs <linux-xfs@vger.kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNS8xLzIwIDEyOjEwIEFNLCBBbmRyZWFzIEdyw7xuYmFjaGVyIHdyb3RlOgo+IEhpLAo+Cj4g
QW0gRG8uLCAzMC4gQXByLiAyMDIwIHVtIDIzOjU2IFVociBzY2hyaWViIEd1b3FpbmcgSmlhbmcK
PiA8Z3VvcWluZy5qaWFuZ0BjbG91ZC5pb25vcy5jb20+Ogo+PiBUaGUgbG9naWMgaW4gYXR0YWNo
X3BhZ2VfYnVmZmVycyBhbmQgIF9fY2xlYXJfcGFnZV9idWZmZXJzIGFyZSBxdWl0ZQo+PiBwYWly
ZWQsIGJ1dAo+Pgo+PiAxLiB0aGV5IGFyZSBsb2NhdGVkIGluIGRpZmZlcmVudCBmaWxlcy4KPj4K
Pj4gMi4gYXR0YWNoX3BhZ2VfYnVmZmVycyBpcyBpbXBsZW1lbnRlZCBpbiBidWZmZXJfaGVhZC5o
LCBzbyBpdCBjb3VsZCBiZQo+PiAgICAgdXNlZCBieSBvdGhlciBmaWxlcy4gQnV0IF9fY2xlYXJf
cGFnZV9idWZmZXJzIGlzIHN0YXRpYyBmdW5jdGlvbiBpbgo+PiAgICAgYnVmZmVyLmMgYW5kIG90
aGVyIHBvdGVudGlhbCB1c2VycyBjYW4ndCBjYWxsIHRoZSBmdW5jdGlvbiwgbWQtYml0bWFwCj4+
ICAgICBldmVuIGNvcGllZCB0aGUgZnVuY3Rpb24uCj4+Cj4+IFNvLCBpbnRyb2R1Y2UgdGhlIG5l
dyBhdHRhY2gvY2xlYXJfcGFnZV9wcml2YXRlIHRvIHJlcGxhY2UgdGhlbS4gV2l0aAo+PiB0aGUg
bmV3IHBhaXIgb2YgZnVuY3Rpb24sIHdlIHdpbGwgcmVtb3ZlIHRoZSB1c2FnZSBvZiBhdHRhY2hf
cGFnZV9idWZmZXJzCj4+IGFuZCAgX19jbGVhcl9wYWdlX2J1ZmZlcnMgaW4gbmV4dCBwYXRjaGVz
LiBUaGFua3MgZm9yIHRoZSBuZXcgbmFtZXMgZnJvbQo+PiBDaHJpc3RvcGggSGVsbHdpZy4KPj4K
Pj4gU3VnZ2VzdGVkLWJ5OiBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPj4g
Q2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4+IENjOiAiRGFy
cmljayBKLiBXb25nIiA8ZGFycmljay53b25nQG9yYWNsZS5jb20+Cj4+IENjOiBXaWxsaWFtIEt1
Y2hhcnNraSA8d2lsbGlhbS5rdWNoYXJza2lAb3JhY2xlLmNvbT4KPj4gQ2M6ICJLaXJpbGwgQS4g
U2h1dGVtb3YiIDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgo+PiBDYzogQW5kcmVh
cyBHcnVlbmJhY2hlciA8YWdydWVuYmFAcmVkaGF0LmNvbT4KPj4gQ2M6IFlhbmcgU2hpIDx5YW5n
LnNoaUBsaW51eC5hbGliYWJhLmNvbT4KPj4gQ2M6IFlhZmFuZyBTaGFvIDxsYW9hci5zaGFvQGdt
YWlsLmNvbT4KPj4gQ2M6IFNvbmcgTGl1IDxzb25nQGtlcm5lbC5vcmc+Cj4+IENjOiBsaW51eC1y
YWlkQHZnZXIua2VybmVsLm9yZwo+PiBDYzogQ2hyaXMgTWFzb24gPGNsbUBmYi5jb20+Cj4+IENj
OiBKb3NlZiBCYWNpayA8am9zZWZAdG94aWNwYW5kYS5jb20+Cj4+IENjOiBEYXZpZCBTdGVyYmEg
PGRzdGVyYmFAc3VzZS5jb20+Cj4+IENjOiBsaW51eC1idHJmc0B2Z2VyLmtlcm5lbC5vcmcKPj4g
Q2M6IEFsZXhhbmRlciBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4KPj4gQ2M6IEphZWdl
dWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4+IENjOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+Cj4+IENjOiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBDYzog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPgo+PiBDYzogbGludXgteGZzQHZn
ZXIua2VybmVsLm9yZwo+PiBDYzogQW50b24gQWx0YXBhcm1ha292IDxhbnRvbkB0dXhlcmEuY29t
Pgo+PiBDYzogbGludXgtbnRmcy1kZXZAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+IENjOiBNaWtl
IE1hcnNoYWxsIDxodWJjYXBAb21uaWJvbmQuY29tPgo+PiBDYzogTWFydGluIEJyYW5kZW5idXJn
IDxtYXJ0aW5Ab21uaWJvbmQuY29tPgo+PiBDYzogZGV2ZWxAbGlzdHMub3JhbmdlZnMub3JnCj4+
IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPj4gQ2M6IFNlYmFzdGlh
biBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vhc3lAbGludXRyb25peC5kZT4KPj4gQ2M6IFJvbWFuIEd1
c2hjaGluIDxndXJvQGZiLmNvbT4KPj4gQ2M6IEFuZHJlYXMgRGlsZ2VyIDxhZGlsZ2VyQGRpbGdl
ci5jYT4KPj4gU2lnbmVkLW9mZi1ieTogR3VvcWluZyBKaWFuZyA8Z3VvcWluZy5qaWFuZ0BjbG91
ZC5pb25vcy5jb20+Cj4+IC0tLQo+PiBSRkMgLT4gUkZDIFYyOiAgQWRkcmVzcyB0aGUgY29tbWVu
dHMgZnJvbSBDaHJpc3RvcGggSGVsbHdpZwo+PiAxLiBjaGFuZ2UgZnVuY3Rpb24gbmFtZXMgdG8g
YXR0YWNoL2NsZWFyX3BhZ2VfcHJpdmF0ZSBhbmQgYWRkIGNvbW1lbnRzLgo+PiAyLiBjaGFuZ2Ug
dGhlIHJldHVybiB0eXBlIG9mIGF0dGFjaF9wYWdlX3ByaXZhdGUuCj4+Cj4+ICAgaW5jbHVkZS9s
aW51eC9wYWdlbWFwLmggfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L3BhZ2VtYXAuaCBiL2luY2x1ZGUvbGludXgvcGFnZW1hcC5oCj4+IGluZGV4
IGE4ZjdiZDhlYTFjNi4uMmU1MTVmMjEwYjE4IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4
L3BhZ2VtYXAuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L3BhZ2VtYXAuaAo+PiBAQCAtMjA1LDYg
KzIwNSw0MSBAQCBzdGF0aWMgaW5saW5lIGludCBwYWdlX2NhY2hlX2FkZF9zcGVjdWxhdGl2ZShz
dHJ1Y3QgcGFnZSAqcGFnZSwgaW50IGNvdW50KQo+PiAgICAgICAgICByZXR1cm4gX19wYWdlX2Nh
Y2hlX2FkZF9zcGVjdWxhdGl2ZShwYWdlLCBjb3VudCk7Cj4+ICAgfQo+Pgo+PiArLyoqCj4+ICsg
KiBhdHRhY2hfcGFnZV9wcml2YXRlIC0gYXR0YWNoIGRhdGEgdG8gcGFnZSdzIHByaXZhdGUgZmll
bGQgYW5kIHNldCBQR19wcml2YXRlLgo+PiArICogQHBhZ2U6IHBhZ2UgdG8gYmUgYXR0YWNoZWQg
YW5kIHNldCBmbGFnLgo+PiArICogQGRhdGE6IGRhdGEgdG8gYXR0YWNoIHRvIHBhZ2UncyBwcml2
YXRlIGZpZWxkLgo+PiArICoKPj4gKyAqIE5lZWQgdG8gdGFrZSByZWZlcmVuY2UgYXMgbW0uaCBz
YWlkICJTZXR0aW5nIFBHX3ByaXZhdGUgc2hvdWxkIGFsc28gaW5jcmVtZW50Cj4+ICsgKiB0aGUg
cmVmY291bnQiLgo+PiArICovCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgYXR0YWNoX3BhZ2VfcHJp
dmF0ZShzdHJ1Y3QgcGFnZSAqcGFnZSwgdm9pZCAqZGF0YSkKPj4gK3sKPj4gKyAgICAgICBnZXRf
cGFnZShwYWdlKTsKPj4gKyAgICAgICBzZXRfcGFnZV9wcml2YXRlKHBhZ2UsICh1bnNpZ25lZCBs
b25nKWRhdGEpOwo+PiArICAgICAgIFNldFBhZ2VQcml2YXRlKHBhZ2UpOwo+PiArfQo+PiArCj4+
ICsvKioKPj4gKyAqIGNsZWFyX3BhZ2VfcHJpdmF0ZSAtIGNsZWFyIHBhZ2UncyBwcml2YXRlIGZp
ZWxkIGFuZCBQR19wcml2YXRlLgo+PiArICogQHBhZ2U6IHBhZ2UgdG8gYmUgY2xlYXJlZC4KPj4g
KyAqCj4+ICsgKiBUaGUgY291bnRlcnBhcnQgZnVuY3Rpb24gb2YgYXR0YWNoX3BhZ2VfcHJpdmF0
ZS4KPj4gKyAqIFJldHVybjogcHJpdmF0ZSBkYXRhIG9mIHBhZ2Ugb3IgTlVMTCBpZiBwYWdlIGRv
ZXNuJ3QgaGF2ZSBwcml2YXRlIGRhdGEuCj4+ICsgKi8KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCAq
Y2xlYXJfcGFnZV9wcml2YXRlKHN0cnVjdCBwYWdlICpwYWdlKQo+PiArewo+PiArICAgICAgIHZv
aWQgKmRhdGEgPSAodm9pZCAqKXBhZ2VfcHJpdmF0ZShwYWdlKTsKPj4gKwo+PiArICAgICAgIGlm
ICghUGFnZVByaXZhdGUocGFnZSkpCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPj4g
KyAgICAgICBDbGVhclBhZ2VQcml2YXRlKHBhZ2UpOwo+PiArICAgICAgIHNldF9wYWdlX3ByaXZh
dGUocGFnZSwgMCk7Cj4+ICsgICAgICAgcHV0X3BhZ2UocGFnZSk7Cj4+ICsKPj4gKyAgICAgICBy
ZXR1cm4gZGF0YTsKPj4gK30KPj4gKwo+IEkgbGlrZSB0aGlzIGluIGdlbmVyYWwsIGJ1dCB0aGUg
bmFtZSBjbGVhcl9wYWdlX3ByaXZhdGUgc3VnZ2VzdHMgdGhhdAo+IHRoaXMgbWlnaHQgYmUgdGhl
IGludmVyc2Ugb3BlcmF0aW9uIG9mIHNldF9wYWdlX3ByaXZhdGUsIHdoaWNoIGl0IGlzCj4gbm90
LiBTbyBtYXliZSB0aGlzIGNhbiBiZSByZW5hbWVkIHRvIGRldGFjaF9wYWdlX3ByaXZhdGUgdG8g
bW9yZQo+IGNsZWFybHkgaW5kaWNhdGUgdGhhdCBpdCBwYWlycyB3aXRoIGF0dGFjaF9wYWdlX3By
aXZhdGU/CgpZZXMsIHRoZSBuZXcgbmFtZSBpcyBiZXR0ZXIsIHRoYW5rIHlvdSEKCkNoZWVycywK
R3VvcWluZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
