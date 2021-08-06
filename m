Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DFA3E263E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 10:38:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBvMu-0000Uu-AB; Fri, 06 Aug 2021 08:38:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hare@suse.de>) id 1mBvMs-0000Un-TG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 08:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MZBqNnNscfHiOGe+k+ov3sat4e7XsHhtjE9C+58y2uc=; b=VODX2uxpGU7AgJeqnq6g4r+k8F
 xDQkM6m0zz68WsYTFj781RwXHQpGDjTAoK8Vas1jjPmQiAfjImNyNR9kdK4F2mOJ0lE74TtqJbq0D
 U2JmeJT9Ic5Gdgq+yu195vSiz9huq60J3nEWRrRVt5jBgfeJd5p8atA/P7XT4idVFJ3E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MZBqNnNscfHiOGe+k+ov3sat4e7XsHhtjE9C+58y2uc=; b=lCPC1vUGP3EPuEoyBDqCpDRRnc
 C5xGJSCPiB9nul2isal69wp5tq8caQvC61kOHV960BTz/rXRQAwpg950qbChGjTw8K45zd2aR7J7+
 g67vR2iNReJVazOGuY1t3xVsQhP5MzgM7h+aWpPJmJKLF/vsK9rulAAgHhMN1Ycxtt1Q=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mBvMp-0001XT-A8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 08:38:14 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1C7CD21BD4;
 Fri,  6 Aug 2021 08:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628239085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MZBqNnNscfHiOGe+k+ov3sat4e7XsHhtjE9C+58y2uc=;
 b=A3hycox/Fm/0aNPL6yk1NYiLoqZxIjc9SkSOOSbAy9TCdCh6Ns4lUMN3IqknGBxy0cnAR3
 ueBCYYiHx1j4Xr6sxJns1hUEkFL8d4JuVejFWbIJZ952doVHW6WoMb4VX+ojNf0M8/jbA/
 Zy2BgBlT6YmnyX+kw/7/NpZR9OLs7zw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628239085;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MZBqNnNscfHiOGe+k+ov3sat4e7XsHhtjE9C+58y2uc=;
 b=aNOCG0J7PpmgPwbQc/65LlLCJj2f93M6tu/nosPkuvOzylpDGIGLjNbX4E2bfIgNcv36ME
 9mupo7VMREFy4xAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01AE313A6A;
 Fri,  6 Aug 2021 08:38:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d0UqOuz0DGEkYwAAMHmgww
 (envelope-from <hare@suse.de>); Fri, 06 Aug 2021 08:38:04 +0000
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Jens Axboe <axboe@kernel.dk>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Paolo Valente <paolo.valente@linaro.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
References: <20210806051140.301127-1-damien.lemoal@wdc.com>
 <20210806051140.301127-3-damien.lemoal@wdc.com>
 <6fdc9b02-d03f-a63f-cefb-1d00ac42b885@suse.de>
 <DM6PR04MB70818B00518B40E671481E76E7F39@DM6PR04MB7081.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <5b2642eb-2817-3814-3469-71027d6b629d@suse.de>
Date: Fri, 6 Aug 2021 10:38:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <DM6PR04MB70818B00518B40E671481E76E7F39@DM6PR04MB7081.namprd04.prod.outlook.com>
Content-Language: en-US
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.6 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mBvMp-0001XT-A8
Subject: Re: [f2fs-dev] [PATCH v2 2/4] block: fix ioprio interface
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOC82LzIxIDg6NTcgQU0sIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IE9uIDIwMjEvMDgvMDYg
MTU6MzUsIEhhbm5lcyBSZWluZWNrZSB3cm90ZToKPj4gT24gOC82LzIxIDc6MTEgQU0sIERhbWll
biBMZSBNb2FsIHdyb3RlOgo+Pj4gQW4gaW9jYiBhaW9fcmVxcHJpbyBmaWVsZCBpcyAxNi1iaXRz
ICh1MTYpIGJ1dCBvZnRlbiBoYW5kbGVkIGFzIGFuIGludAo+Pj4gaW4gdGhlIGJsb2NrIGxheWVy
LiBFLmcuIGlvcHJpb19jaGVja19jYXAoKSB0YWtlcyBhbiBpbnQgYXMgYXJndW1lbnQuCj4+PiBX
aXRoIHN1Y2ggaW1wbGljaXQgaW50IGNhc3RpbmcgZnVuY3Rpb24gY2FsbHMsIHRoZSB1cHBlciAx
Ni1iaXRzIG9mIHRoZQo+Pj4gaW50IGFyZ3VtZW50IG1heSBiZSBsZWZ0IHVuaW5pdGlhbGl6ZWQg
YnkgdGhlIGNvbXBpbGVyLCByZXN1bHRpbmcgaW4KPj4+IGludmFsaWQgdmFsdWVzIGZvciB0aGUg
SU9QUklPX1BSSU9fQ0xBU1MoKSBtYWNybyAoZ2FyYmFnZSB1cHBlciBiaXRzKQo+Pj4gYW5kIGlu
IGFuIGVycm9yIHJldHVybiBmb3IgZnVuY3Rpb25zIHN1Y2ggYXMgaW9wcmlvX2NoZWNrX2NhcCgp
Lgo+Pj4KPj4+IEZpeCB0aGlzIGJ5IG1hc2tpbmcgdGhlIHJlc3VsdCBvZiB0aGUgc2hpZnQgYnkg
SU9QUklPX0NMQVNTX1NISUZUIGJpdHMKPj4+IGluIHRoZSBJT1BSSU9fUFJJT19DTEFTUygpIG1h
Y3JvLiBUaGUgbmV3IG1hY3JvIElPUFJJT19DTEFTU19NQVNLCj4+PiBkZWZpbmVzIHRoZSAzLWJp
dHMgbWFzayBmb3IgdGhlIHByaW9yaXR5IGNsYXNzLgo+Pj4KPj4+IFdoaWxlIGF0IGl0LCBjbGVh
bnVwIHRoZSBmb2xsb3dpbmc6Cj4+PiAqIEFwcGx5IHRoZSBtYXNrIElPUFJJT19QUklPX01BU0sg
dG8gdGhlIGRhdGEgYXJndW1lbnQgb2YgdGhlCj4+PiAgICBJT1BSSU9fUFJJT19WQUxVRSgpIG1h
Y3JvIHRvIGlnbm9yZSB1cHBlciBiaXRzIG9mIHRoZSBkYXRhIHZhbHVlLgo+Pj4gKiBSZW1vdmUg
dW5uZWNlc3NhcnkgcGFyZW50aGVzaXMgYXJvdW5kIGZpeGVkIHZhbHVlcyBpbiB0aGUgbWFjcm8K
Pj4+ICAgIGRlZmluaXRpb25zIGluIGluY2x1ZGUvdWFwaS9saW51eC9pb3ByaW8uaC4KPj4+ICog
VXBkYXRlIHRoZSBvdXRkYXRlZCBtZW50aW9uIG9mIENGUSBpbiB0aGUgY29tbWVudCBkZXNjcmli
aW5nIHByaW9yaXR5Cj4+PiAgICBjbGFzc2VzIGFuZCBpbnN0ZWFkIG1lbnRpb24gQkZRIGFuZCBt
cS1kZWFkbGluZS4KPj4+ICogQ2hhbmdlIHRoZSBhcmd1bWVudCBuYW1lIG9mIHRoZSBJT1BSSU9f
UFJJT19DTEFTUygpIGFuZAo+Pj4gICAgSU9QUklPX1BSSU9fREFUQSgpIG1hY3JvcyBmcm9tICJt
YXNrIiB0byAiaW9wcmlvIiB0byByZWZsZWN0IHRoZSBmYWN0Cj4+PiAgICB0aGF0IGFuIElPIHBy
aW9yaXR5IHZhbHVlIHNob3VsZCBiZSBwYXNzZWQgcmF0aGVyIHRoYW4gYSBtYXNrLgo+Pj4gKiBD
aGFuZ2UgdGhlIGlvcHJpb192YWxpZCgpIG1hY3JvIGludG8gYW4gaW5saW5lIGZ1bmN0aW9uLCBh
ZGRpbmcgYQo+Pj4gICAgY2hlY2sgb24gdGhlIG1heGltdW0gdmFsdWUgb2YgdGhlIGNsYXNzIG9m
IGEgcHJpb3JpdHkgdmFsdWUgYXMKPj4+ICAgIGRlZmluZWQgYnkgdGhlIElPUFJJT19DTEFTU19N
QVggZW51bSB2YWx1ZS4gTW92ZSB0aGlzIGZ1bmN0aW9uIHRvCj4+PiAgICB0aGUga2VybmVsIHNp
ZGUgaW4gaW5jbHVkZS9saW51eC9pb3ByaW8uaC4KPj4+ICogUmVtb3ZlIHRoZSB1bm5lY2Vzc2Fy
eSAiZWxzZSIgYWZ0ZXIgdGhlIHJldHVybiBzdGF0ZW1lbnRzIGluCj4+PiAgICB0YXNrX25pY2Vf
aW9jbGFzcygpLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IERhbWllbiBMZSBNb2FsIDxkYW1pZW4u
bGVtb2FsQHdkYy5jb20+Cj4+PiAtLS0KPj4+ICAgaW5jbHVkZS9saW51eC9pb3ByaW8uaCAgICAg
IHwgMTUgKysrKysrKysrKysrLS0tCj4+PiAgIGluY2x1ZGUvdWFwaS9saW51eC9pb3ByaW8uaCB8
IDE5ICsrKysrKysrKysrLS0tLS0tLS0KPj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspLCAxMSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9pb3ByaW8uaCBiL2luY2x1ZGUvbGludXgvaW9wcmlvLmgKPj4+IGluZGV4IGVmOWFkNGZiMjQ1
Zi4uOWIzYTZkODE3MmI0IDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9pb3ByaW8uaAo+
Pj4gKysrIGIvaW5jbHVkZS9saW51eC9pb3ByaW8uaAo+Pj4gQEAgLTgsNiArOCwxNiBAQAo+Pj4g
ICAKPj4+ICAgI2luY2x1ZGUgPHVhcGkvbGludXgvaW9wcmlvLmg+Cj4+PiAgIAo+Pj4gKy8qCj4+
PiArICogQ2hlY2sgdGhhdCBhIHByaW9yaXR5IHZhbHVlIGhhcyBhIHZhbGlkIGNsYXNzLgo+Pj4g
KyAqLwo+Pj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBpb3ByaW9fdmFsaWQodW5zaWduZWQgc2hvcnQg
aW9wcmlvKQo+Pgo+PiBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gdXNlICd1MTYnIGhlcmUgYXMg
dHlwZSwgYXMgd2UncmUgcmVseWluZyBvbiB0aGUgCj4+IG51bWJlciBvZiBiaXRzPwo+IAo+IE90
aGVyIGZ1bmN0aW9ucyBpbiBibG9jay9pb3ByaW8uYyBhbmQgaW4gaW5jbHVkZS9saW51eC9pb3By
aW8uaCB1c2UgInVuc2lnbmVkCj4gc2hvcnQiLCBzbyBJIGZvbGxvd2VkLiBCdXQgbWFueSBmdW5j
dGlvbnMsIGlmIG5vdCBtb3N0LCB1c2UgImludCIuIFRoaXMgaXMgYWxsIGEKPiBiaXQgb2YgYSBt
ZXNzLiBJIHRoaW5rIHdlIG5lZWQgYSAidHlwZWRlZiBpb3ByaW9fdCB1MTY7IiB0byBjbGVhbiB0
aGluZ3MgdXAuIEJ1dAo+IHRoZXJlIGFyZSBhIGxvdCBvZiBwbGFjZXMgdG8gZml4LiBJIGNhbiBh
ZGQgc3VjaCBwYXRjaC4uLiBXb3J0aCBpdCA/Cj4gClBvc3NpYmx5IG5vdC4KQ29uc2lkZXIgbXkg
Y29tbWVudCByZXRyYWN0ZWQgOi0pCgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVp
bmVja2UJCSAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZQkJ
CSAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgw
OSAoQUcgTsO8cm5iZXJnKSwgR0Y6IEZlbGl4IEltZW5kw7ZyZmZlcgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
