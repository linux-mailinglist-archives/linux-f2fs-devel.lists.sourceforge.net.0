Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5990995D886
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2024 23:33:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1shbu5-0005dL-3x;
	Fri, 23 Aug 2024 21:33:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1shbu3-0005dF-E2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Aug 2024 21:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f8mSwkgnyQPo6Q0vx0G71jWyqffsVfB3oVMh6Szvr+c=; b=LFyk96MKtLI0mZ6s5l0LbMcJxj
 0O8kSPK3NFHpf9hUI/evUBG4n59O6JEGVEhIRwGTtUbxsjZWtNYbyUmke2lMNFKlI81K7WsUxOR89
 naf6O+HyQn+DxwuFx8pI3Y+UicXh/rG6OJ1OdVP4Jmp3JlpqlJVmyBy6mZLjhWMmIyBM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f8mSwkgnyQPo6Q0vx0G71jWyqffsVfB3oVMh6Szvr+c=; b=R+rRP962g+0rCheLc14c9jQjgK
 2H67HilhGZhrI2kaJFNYNwLynTXaQTGE9oUPUhCnWNFeCdBOB8Y2SpxG4hBJVRA/aXalQ1+XfvDwb
 o6laMETBrj+SmJTGFK2oW1UbqyUA+ucW3FkbI6ZOG+W7BU3TwdGNuBvzw9upCAH54/tU=;
Received: from mout.gmx.net ([212.227.17.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1shbu1-0001gh-VG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Aug 2024 21:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1724448753; x=1725053553; i=quwenruo.btrfs@gmx.com;
 bh=f8mSwkgnyQPo6Q0vx0G71jWyqffsVfB3oVMh6Szvr+c=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=aBdSYuLfQpzFvGNyShvTzHN0BagH6u+o2kLEjGtGQkTVzF7+BKZ0mSspyKLdARsu
 EmsYYSIhLzuKqGqng6R2/bFwe1YDtg5ZLbaaKUDv5KSNwKDHHitdNmREi6ErDo0/t
 a67rp4L/eMlrLchSVZIWyv+bplubZAytsMNvMnbansJL12UpK+PFgzOF2YUCHoHbo
 /jAWiG8g24rpfa6ui73fGstUm8s+/Cj7YMA/oUHOXhbWC4EmXuasvzJAAefDnjURo
 4ePtiLJi2kg43ghyUji8KrUIBrw7irTnrFAcM2kSniIo3s3RyY1GRBSSkKWQO9DTK
 Z4Gk+p9pyHdZo5Gr7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.191] ([159.196.52.54]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MdvmY-1s9uyN0ajG-00dTSY; Fri, 23
 Aug 2024 23:32:33 +0200
Message-ID: <ff1e31d3-5c4a-407b-89a3-ded574dc3a2a@gmx.com>
Date: Sat, 24 Aug 2024 07:02:27 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240822013714.3278193-3-lizetao1@huawei.com>
 <Zsaq_QkyQIhGsvTj@casper.infradead.org>
 <0f643b0f-f1c2-48b7-99d5-809b8b7f0aac@gmx.com>
 <ZscqGAMm1tofHSSG@casper.infradead.org>
 <38247c40-604b-443a-a600-0876b596a284@gmx.com>
 <7a04ac3b-e655-4a80-89dc-19962db50f05@gmx.com>
 <Zsis82IKSAq6Mgms@casper.infradead.org>
Content-Language: en-US
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCY00iVQUJDToH
 pgAKCRDCPZHzoSX+qNKACACkjDLzCvcFuDlgqCiS4ajHAo6twGra3uGgY2klo3S4JespWifr
 BLPPak74oOShqNZ8yWzB1Bkz1u93Ifx3c3H0r2vLWrImoP5eQdymVqMWmDAq+sV1Koyt8gXQ
 XPD2jQCrfR9nUuV1F3Z4Lgo+6I5LjuXBVEayFdz/VYK63+YLEAlSowCF72Lkz06TmaI0XMyj
 jgRNGM2MRgfxbprCcsgUypaDfmhY2nrhIzPUICURfp9t/65+/PLlV4nYs+DtSwPyNjkPX72+
 LdyIdY+BqS8cZbPG5spCyJIlZonADojLDYQq4QnufARU51zyVjzTXMg5gAttDZwTH+8LbNI4
 mm2YzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCY00ibgUJDToHvwAK
 CRDCPZHzoSX+qK6vB/9yyZlsS+ijtsvwYDjGA2WhVhN07Xa5SBBvGCAycyGGzSMkOJcOtUUf
 tD+ADyrLbLuVSfRN1ke738UojphwkSFj4t9scG5A+U8GgOZtrlYOsY2+cG3R5vjoXUgXMP37
 INfWh0KbJodf0G48xouesn08cbfUdlphSMXujCA8y5TcNyRuNv2q5Nizl8sKhUZzh4BascoK
 DChBuznBsucCTAGrwPgG4/ul6HnWE8DipMKvkV9ob1xJS2W4WJRPp6QdVrBWJ9cCdtpR6GbL
 iQi22uZXoSPv/0oUrGU+U5X4IvdnvT+8viPzszL5wXswJZfqfy8tmHM85yjObVdIG6AlnrrD
In-Reply-To: <Zsis82IKSAq6Mgms@casper.infradead.org>
X-Provags-ID: V03:K1:9tQbeQ4b9S06l9tgBRI1QlrRc+ehSgemh/yVOGcPn+/pR3zjk7I
 jFtzJKpp+b9OdTIWvUEvRAa2Gow/R4Wq4e0lbE1Y/AtLKfVnOC+WeCGCe6GICxnT66ez8EA
 WJOvO6Xk3+9uvAfOt+ai5mOiUa/wWK1HmFxMztIEOUXoOWN7FzjG1cf4BU+VyVyY2lKGlRq
 uhj3uPR2jnzx4mk1ELjGg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yWGEyrX/yws=;hK+f8NUt9DZu4i4h88xhVlO42Um
 fOrILI5FZIGtrdyuGT2OpV3ULziEGuy/sLyFpnJFKPTAvNm6C0qIUyyzoeIl2Ss07nt6JlhJ3
 8/Fy+LlbLY4kn4DzLSuWlKaKQeHW02Dc0jydD2WuIFR2dwoIkMGJfarJHWeUgkhU3UjOZdDwv
 UnWyObAUqE3PDomwG9ROySnmuKk236vf1R6Gy5Aa3Q/cYoHSRI7akwIabsUegsVz717gkL37e
 3lDVw2QE7N/+D/Xh3IB/D0cg1vf8BrSkOhYdR6+h6pMQk3NP5Qb3T2eW6kDJT0BKYAFZ4QAVg
 HCY+6RrODXi6KtbJiTij/gx6TR0YCc+hirx1GXmXINSfUmXKrYPrel8Z/c+e1CWutS9fRqWHn
 o1I/k0FtT+jeW958DQgqz71pVbVEBvlwi335T5kD/VWJy53Kn0PlosAVq/R0DG/TyMS0X9Fpz
 h12wKi1UutEWEvIyul/jJnHIHwrCKZMwSN0MVATWCzhhM+L688vunjYWc5cr3FfwxA1VAyyIy
 wBCFCrdKZCgMY2EK+nRegk6QEe+NzNXIuaMEipaGz3VbERoQQMWFmi0N8jXO+FimPiEKt5SXU
 Gv6UjqP0bmeGME9CVmFiCgT6YuNgwSisruLfbD/xlel7nTDJCYMc4ojx0dPgz3aZCOLGpBTuT
 x43pkYUFFM3Hm/lPn5i9PBkLsx7skij/iLFkGfrnc/UnfyvJeawgI3/6xVnAgfkgULRiX4SoN
 FmRQEnInYA5Cs1iOVLmyn58akRt6/oe7R0NNmQ11NzxfStQfB+PFlJB8uLAF9nU0Ongy1vy2m
 pHKz22yniVqywUg6VGywSJnQ==
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2024/8/24 01:08, Matthew Wilcox 写道: > On Fri, Aug
   23, 2024 at 11:43:41AM +0930, Qu Wenruo wrote: >> 在 2024/8/23 07:55, Qu
   Wenruo 写道: >>> 在 2024/8/22 21:37, Matthew Wilcox 写道: >>>> [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: gmx.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [212.227.17.21 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [212.227.17.21 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [212.227.17.21 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [212.227.17.21 listed in wl.mailspike.net]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [quwenruo.btrfs[at]gmx.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1shbu1-0001gh-VG
Subject: Re: [f2fs-dev] [PATCH 02/14] btrfs: convert
 get_next_extent_buffer() to take a folio
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
From: Qu Wenruo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: josef@toxicpanda.com, linux-f2fs-devel@lists.sourceforge.net, clm@fb.com,
 terrelln@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNC84LzI0IDAxOjA4LCBNYXR0aGV3IFdpbGNveCDlhpnpgZM6Cj4gT24gRnJpLCBB
dWcgMjMsIDIwMjQgYXQgMTE6NDM6NDFBTSArMDkzMCwgUXUgV2VucnVvIHdyb3RlOgo+PiDlnKgg
MjAyNC84LzIzIDA3OjU1LCBRdSBXZW5ydW8g5YaZ6YGTOgo+Pj4g5ZyoIDIwMjQvOC8yMiAyMToz
NywgTWF0dGhldyBXaWxjb3gg5YaZ6YGTOgo+Pj4+IE9uIFRodSwgQXVnIDIyLCAyMDI0IGF0IDA4
OjI4OjA5UE0gKzA5MzAsIFF1IFdlbnJ1byB3cm90ZToKPj4+Pj4gQnV0IHdoYXQgd2lsbCBoYXBw
ZW4gaWYgc29tZSB3cml0ZXMgaGFwcGVuZWQgdG8gdGhhdCBsYXJnZXIgZm9saW8/Cj4+Pj4+IERv
IE1NIGxheWVyIGRldGVjdHMgdGhhdCBhbmQgc3BsaXQgdGhlIGZvbGlvcz8gT3IgdGhlIGZzIGhh
cyB0byBnbyB0aGUKPj4+Pj4gc3VicGFnZSByb3V0aW5lICh3aXRoIGFuIGV4dHJhIHN0cnVjdHVy
ZSByZWNvcmRpbmcgYWxsIHRoZSBzdWJwYWdlIGZsYWdzCj4+Pj4+IGJpdG1hcCk/Cj4+Pj4KPj4+
PiBFbnRpcmVseSB1cCB0byB0aGUgZmlsZXN5c3RlbS7CoCBJdCB3b3VsZCBoZWxwIGlmIGJ0cmZz
IHVzZWQgdGhlIHNhbWUKPj4+PiB0ZXJtaW5vbG9neSBhcyB0aGUgcmVzdCBvZiB0aGUgZmlsZXN5
c3RlbXMgaW5zdGVhZCBvZiBpbnZlbnRpbmcgaXRzIG93bgo+Pj4+ICJzdWJwYWdlIiB0aGluZy7C
oCBBcyBmYXIgYXMgSSBjYW4gdGVsbCwgInN1YnBhZ2UiIG1lYW5zICJmcyBibG9jayBzaXplIiwK
Pj4+PiBidXQgbWF5YmUgaXQgaGFzIGEgZGlmZmVyZW50IG1lYW5pbmcgdGhhdCBJIGhhdmVuJ3Qg
YXNjZXJ0YWluZWQuCj4+Pgo+Pj4gVGhlbiB0ZWxsIG1lIHRoZSBjb3JyZWN0IHRlcm1pbm9sb2d5
IHRvIGRlc2NyaWJlIGZzIGJsb2NrIHNpemUgc21hbGxlcgo+Pj4gdGhhbiBwYWdlIHNpemUgaW4g
dGhlIGZpcnN0IHBsYWNlLgo+Pj4KPj4+ICJmcyBibG9jayBzaXplIiBpcyBub3QgZ29vZCBlbm91
Z2gsIHdlIHdhbnQgYSB0ZXJtaW5vbG9neSB0byBkZXNjcmliZQo+Pj4gImZzIGJsb2NrIHNpemUi
IHNtYWxsZXIgdGhhbiBwYWdlIHNpemUuCj4KPiBPaCBkZWFyLiAgYnRyZnMgcmVhbGx5IGhhcyBj
b3JydXB0ZWQgeW91ciBicmFpbi4gIEhlcmUncyB0aGUgdGVybWlub2xvZ3kKPiB1c2VkIGluIHRo
ZSByZXN0IG9mIExpbnV4Ogo+Cj4gU0VDVE9SX1NJWkUuICBGaXhlZCBhdCA1MTIgYnl0ZXMuICBU
aGlzIGlzIHRoZSB1bml0IHVzZWQgdG8gY29tbXVuaWNhdGUKPiB3aXRoIHRoZSBibG9jayBsYXll
ci4gIEl0IGhhcyBubyByZWFsIG1lYW5pbmcsIG90aGVyIHRoYW4gTGludXggZG9lc24ndAo+IHN1
cHBvcnQgYmxvY2sgZGV2aWNlcyB3aXRoIDEyOCBhbmQgMjU2IGJ5dGUgc2VjdG9yIHNpemVzIChJ
IGhhdmUgdXNlZAo+IHN1Y2ggc3lzdGVtcywgYnV0IG5vdCBpbiB0aGUgbGFzdCAzMCB5ZWFycyku
Cj4KPiBMQkEgc2l6ZS4gIFRoaXMgaXMgdGhlIHVuaXQgdGhhdCB0aGUgYmxvY2sgbGF5ZXIgdXNl
cyB0byBjb21tdW5pY2F0ZQo+IHdpdGggdGhlIGJsb2NrIGRldmljZS4gIE11c3QgYmUgYXQgbGVh
c3QgU0VDVE9SX1NJWkUuICBJL08gY2Fubm90IGJlCj4gcGVyZm9ybWVkIGluIHNtYWxsZXIgY2h1
bmtzIHRoYW4gdGhpcy4KPgo+IFBoeXNpY2FsIGJsb2NrIHNpemUuICBUaGlzIGlzIHRoZSB1bml0
IHRoYXQgdGhlIGRldmljZSBhZHZlcnRpc2VzIGFzCj4gaXRzIGVmZmljaWVudCBtaW5pbXVtIHNp
emUuICBJL09zIHNtYWxsZXIgdGhhbiB0aGlzIC8gbm90IGFsaWduZWQgdG8KPiB0aGlzIHdpbGwg
cHJvYmFibHkgaW5jdXIgYSBwZXJmb3JtYW5jZSBwZW5hbHR5IGFzIHRoZSBkZXZpY2Ugd2lsbCBu
ZWVkCj4gdG8gZG8gYSByZWFkLW1vZGlmeS13cml0ZSBjeWNsZS4KPgo+IGZzIGJsb2NrIHNpemUu
ICBLbm93biBhcyBzX2Jsb2Nrc2l6ZSBvciBpX2Jsb2Nrc2l6ZS4gIE11c3QgYmUgYSBtdWx0aXBs
ZQo+IG9mIExCQSBzaXplLCBidXQgbWF5IGJlIHNtYWxsZXIgdGhhbiBwaHlzaWNhbCBibG9jayBz
aXplLiAgRmlsZXMgYXJlCj4gYWxsb2NhdGVkIGluIG11bHRpcGxlcyBvZiB0aGlzIHVuaXQuCj4K
PiBQQUdFX1NJWkUuICBVbml0IHRoYXQgbWVtb3J5IGNhbiBiZSBtYXBwZWQgaW4uICBUaGlzIGFw
cGxpZXMgdG8gYm90aAo+IHVzZXJzcGFjZSBtYXBwaW5nIG9mIGZpbGVzIGFzIHdlbGwgYXMgY2Fs
bHMgdG8ga21hcF9sb2NhbF8qKCkuCj4KPiBmb2xpbyBzaXplLiAgVGhlIHNpemUgdGhhdCB0aGUg
cGFnZSBjYWNoZSBoYXMgZGVjaWRlZCB0byBtYW5hZ2UgdGhpcwo+IGNodW5rIG9mIHRoZSBmaWxl
IGluLiAgQSBtdWx0aXBsZSBvZiBQQUdFX1NJWkUuCj4KPgo+IEkndmUgbW9zdGx5IGxpc3RlZCB0
aGlzIGluIHNtYWxsZXN0IHRvIGxhcmdlc3QuICBUaGUgcmVsYXRpb25zaGlwcyB0aGF0Cj4gbXVz
dCBiZSB0cnVlOgo+Cj4gU1MgPD0gTEJBIDw9IFBoeXMKPiBMQkEgPD0gZnNiCj4gUFMgPD0gZm9s
aW8KPiBmc2IgPD0gZm9saW8KPgo+IG9jZnMyIHN1cHBvcnRzIGZzYiA+IFBBR0VfU0laRSwgYnV0
IHRoaXMgaXMgYSByYXJpdHkuICBNb3N0IGZpbGVzeXN0ZW1zCj4gcmVxdWlyZSBmc2IgPD0gUEFH
RV9TSVpFLgo+Cj4gRmlsZXN5c3RlbXMgbGlrZSBVRlMgYWxzbyBzdXBwb3J0IGEgZnJhZ21lbnQg
c2l6ZSB3aGljaCBpcyBsZXNzIHRoYW4gZnMKPiBibG9jayBzaXplLiAgSXQncyBraW5kIG9mIGxp
a2UgdGFpbCBwYWNraW5nLiAgQW55d2F5LCB0aGF0J3MgaW50ZXJuYWwgdG8KPiB0aGUgZmlsZXN5
c3RlbSBhbmQgbm90IGV4cG9zZWQgdG8gdGhlIFZGUy4KCkkga25vdyBhbGwgdGhlc2UgdGhpbmdz
LCB0aGUgdGVybWlub2xvZ3kgSSBuZWVkIGlzIGEgc2hvcnQgb25lIHRvCmRlc2NyaWJlIGZzYiA8
IFBBR0VfU0laRSBjYXNlLgoKU28gZmFyLCBpbiB0aGUgZnMnIHJlYWxtLCAic3VicGFnZSIgKHN1
YiBwYWdlIHNpemVkIGJsb2NrIHNpemUpIGlzIHRoZQpzaG9ydGVzdCBhbmQgc2ltcGxlc3Qgb25l
LgoKU3VyZSB5b3Ugd2lsbCBnZXQgY29uZnVzZWQgd2l0aCBhICJzdWJwYWdlIiByYW5nZSAgaW5z
aWRlIGEgcGFnZSwgYnV0CnRoYXQncyBiZWNhdXNlIHlvdSdyZSBtb3N0bHkgd29ya2luZyBpbiB0
aGUgTU0gbGF5ZXIuCgpTbyBwbGVhc2UgZ2l2ZSBtZSBhIGJldHRlciBhbHRlcm5hdGl2ZSB0byBk
ZXNjcmliZSBleGFjdCAiZmJzIDwKUEFHRV9TSVpFIiBjYXNlLgpPciBpdCdzIGp1c3QgY29tcGxh
aW5pbmcgd2l0aG91dCBhbnkgY29uc3RydWN0aXZlIGFkdmljZS4KCj4KPj4+PiBJIGhhdmUgbm8g
aWRlYSB3aHkgYnRyZnMgdGhpbmtzIGl0IG5lZWRzIHRvIHRyYWNrIHdyaXRlYmFjaywgb3JkZXJl
ZCwKPj4+PiBjaGVja2VkIGFuZCBsb2NrZWQgaW4gYSBiaXRtYXAuwqAgVGhvc2UgbWFrZSBubyBz
ZW5zZSB0byBtZS7CoCBCdXQgdGhleQo+Pj4+IG1ha2Ugbm8gc2Vuc2UgdG8gbWUgaWYgeW91J3Jl
IHN1cHBvcnQgYSA0S2lCIGZpbGVzeXN0ZW0gb24gYSBtYWNoaW5lCj4+Pj4gd2l0aCBhIDY0S2lC
IFBBR0VfU0laRSwgbm90IGp1c3QgaW4gdGhlIGNvbnRleHQgb2YgImxhcmdlciBmb2xpb3MiLgo+
Pj4+IFdyaXRlYmFjayBpcyBzb21ldGhpbmcgdGhlIFZNIHRlbGxzIHlvdSB0byBkbzsgd2h5IGRv
IHlvdSBuZWVkIHRvIHRhZwo+Pj4+IGluZGl2aWR1YWwgYmxvY2tzIGZvciB3cml0ZWJhY2s/Cj4+
Pgo+Pj4gQmVjYXVzZSB0aGVyZSBhcmUgY2FzZXMgd2hlcmUgYnRyZnMgbmVlZHMgdG8gb25seSB3
cml0ZSBiYWNrIHBhcnQgb2YgdGhlCj4+PiBmb2xpbyBpbmRlcGVuZGVudGx5Lgo+Cj4gaW9tYXAg
bWFuYWdlcyB0byBkbyB0aGlzIHdpdGggb25seSB0cmFja2luZyBwZXItYmxvY2sgZGlydHkgYml0
cy4KCldlbGwsIGRvZXMgaW9tYXAgc3VwcG9ydCBhc3luY2hyb25vdXMgY29tcHJlc3Npb24/CgpU
aGlzIHByb3ZlcyB0aGUgcG9pbnQgb2YgSm9zZWYsIGRpZmZlcmVudCBwZW9wbGUgaGF2ZSBkaWZm
ZXJlbnQgZm9jdXMsCnBsZWFzZSBkbyBub3QgYXNzdW1lIGV2ZXJ5b25lIGtub3dzIHRoZSByZWFs
bSB5b3UncmUgZG9pbmcsIG5vciBhc3N1bWUKdGhlcmUgd2lsbCBhbHdheXMgYmUgYSBvbmUtZml0
LWFsbCBzb2x1dGlvbi4KCj4KPj4+IEFuZCBlc3BlY2lhbGx5IGZvciBtaXhpbmcgY29tcHJlc3Np
b24gYW5kIG5vbi1jb21wcmVzc2lvbiB3cml0ZXMgaW5zaWRlCj4+PiBhIHBhZ2UsIGUuZzoKPj4+
Cj4+PiAgIMKgwqDCoMKgwqAgMMKgwqDCoMKgIDE2S8KgwqDCoMKgIDMyS8KgwqDCoMKgIDQ4S8Kg
wqDCoMKgwqAgNjRLCj4+PiAgIMKgwqDCoMKgwqAgfC8vfMKgwqDCoMKgwqDCoMKgwqDCoCB8Ly8v
Ly8vL3wKPj4+ICAgwqDCoMKgwqDCoMKgwqDCoCA0Swo+Pj4KPj4+IEluIGFib3ZlIGNhc2UsIGlm
IHdlIG5lZWQgdG8gd3JpdGViYWNrIGFib3ZlIHBhZ2Ugd2l0aCA0SyBzZWN0b3Igc2l6ZSwKPj4+
IHRoZW4gdGhlIGZpcnN0IDRLIGlzIG5vdCBzdWl0YWJsZSBmb3IgY29tcHJlc3Npb24gKHJlc3Vs
dCB3aWxsIHN0aWxsCj4+PiB0YWtlIGEgZnVsbCA0SyBibG9jayksIHdoaWxlIHRoZSByYW5nZSBb
MzJLLCA0OEspIHdpbGwgYmUgY29tcHJlc3NlZC4KPj4+Cj4+PiBJbiB0aGF0IGNhc2UsIFswLCA0
SykgcmFuZ2Ugd2lsbCBiZSBzdWJtaXR0ZWQgZGlyZWN0bHkgZm9yIElPLgo+Pj4gTWVhbndoaWxl
IFszMkssIDQ4KSB3aWxsIGJlIHN1Ym1pdHRlZCBmb3IgY29tcHJlc3Npb24gaW4gYW50b2hlciB3
cS4KPj4+IChPciB0aW1lIGNvbnN1bWluZyBjb21wcmVzc2lvbiB3aWxsIGRlbGF5IHRoZSB3cml0
ZWJhY2sgb2YgdGhlIHJlbWFpbmluZwo+Pj4gcGFnZXMpCj4+Pgo+Pj4gVGhpcyBtZWFucyB0aGUg
ZGlydHkvd3JpdGViYWNrIGZsYWdzIHdpbGwgaGF2ZSBhIGRpZmZlcmVudCB0aW1pbmcgdG8gYmUK
Pj4+IGNoYW5nZWQuCj4+Cj4+IEp1c3QgaW4gY2FzZSBpZiB5b3UgbWVhbiB1c2luZyBhbiBhdG9t
aWMgdG8gdHJhY2UgdGhlIHdyaXRlYmFjay9sb2NrCj4+IHByb2dyZXNzLCB0aGVuIGl0J3MgcG9z
c2libGUgdG8gZ28gdGhhdCBwYXRoLCBidXQgZm9yIG5vdyBpdCdzIG5vdCBzcGFjZQo+PiBlZmZp
Y2llbnQuCj4+Cj4+IEZvciAxNiBibG9ja3MgcGVyIHBhZ2UgY2FzZSAoNEsgc2VjdG9yc2l6ZSA2
NEsgcGFnZSBzaXplKSwgZWFjaCBhdG9taWMKPj4gdGFrZXMgNCBieXRlcyB3aGlsZSBhIGJpdG1h
cCBvbmx5IHRha2VzIDIgYnl0ZXMuCj4+Cj4+IEFuZCBmb3IgNEsgc2VjdG9yc2l6ZSAxNksgcGFn
ZSBzaXplIGNhc2UsIGl0J3Mgd29yc2UgYW5kIGJ0cmZzIGNvbXBhY3QKPj4gYWxsIHRoZSBiaXRt
YXBzIGludG8gYSBsYXJnZXIgb25lIHRvIHNhdmUgbW9yZSBzcGFjZSwgd2hpbGUgZWFjaCBhdG9t
aWMKPj4gc3RpbGwgdGFrZXMgNCBieXRlcy4KPgo+IFN1cmUsIGJ1dCBpdCBkb2Vzbid0IHNjYWxl
IHVwIHdlbGwuICBBbmQgaXQncyBraW5kIG9mIGlycmVsZXZhbnQgd2hldGhlcgo+IHlvdSBvY2N1
cHkgMiBvciA0IGJ5dGVzIGF0IHRoZSBsb3cgZW5kIGJlY2F1c2UgeW91J3JlIGFsbG9jYXRpbmcg
YWxsCj4gdGhpcyB0aHJvdWdoIHNsYWIsIHNvIHlvdSBnZXQgcm91bmRlZCB0byA4IGJ5dGVzIGFu
eXdheS4KPiBpb21hcF9mb2xpb19zdGF0ZSBjdXJyZW50bHkgb2NjdXBpZXMgMTIgYnl0ZXMgKyAy
IGJpdHMgcGVyIGJsb2NrLiAgU28KPiBmb3IgYSAxNiBibG9jayBmb2xpbyAoNGsgaW4gNjRrKSwg
dGhhdCdzIDMyIGJpdHMgZm9yIGEgdG90YWwgb2YgMTYKPiBieXRlcy4gIEZvciBhIDJNQiBmb2xp
byBvbiBhIDRrQiBibG9jayBzaXplIGZzLCB0aGF0J3MgMTAyNCBiaXRzIGZvcgo+IGEgdG90YWwg
b2YgMTQwIGJ5dGVzIChyb3VuZGVkIHRvIDE5MiBieXRlcyBieSBzbGFiKS4KClllcyBpdCdzIG5v
dCBzY2FsYWJsZSBmb3IgYWxsIGZvbGlvIHNpemVzLCBidXQgdGhlIHR1cm5pbmcgcG9pbnQgaXMg
MzIKYml0cywgd2hpY2ggbWVhbnMgMTI4SyBmb2xpbyBmb3IgNEsgcGFnZSBzaXplZCBzeXN0ZW0u
ClNpbmNlIHRoZSBmb2xpbyBjb2RlIGFscmVhZHkgY29uc2lkZXIgb3JkZXIgPiAzIGFzIGNvc3Rs
eSwgSSdtIHRvdGFsbHkKZmluZSB0byBzYWNyaWZpY2UgdGhlIGhpZ2hlciBvcmRlciBvbmVzLCBu
b3QgdGhlIG90aGVyIHdheSBhcm91bmQuCgpBbHRob3VnaCB0aGUgcmVhbCBkZXRlcm1pbmluZyBm
YWN0b3IgaXMgdGhlIHJlYWwgd29ybGQgZGlzdHJpYnV0aW9uIG9mCmZvbGlvIHNpemVzLgoKQnV0
IGZvciBub3csIHNpbmNlIGJ0cmZzIG9ubHkgc3VwcG9ydHMgNEsgYmxvY2sgc2l6ZSB3aXRoIDY0
Sy8xNksgcGFnZQpzaXplLCBpdCdzIHN0aWxsIGEgd2luIGZvciB1cy4KCkFub3RoZXIgcG9pbnQg
b2YgdGhlIGJpdG1hcCBpcywgaXQgaGVscHMgKGF0IGxlYXN0IGZvciBtZSkgYSBsb3QgZm9yCmRl
YnVnZ2luZywgYnV0IHRoYXQgY2FuIGFsd2F5cyBiZSBoaWRkZW4gYmVoaW5kIHNvbWUgZGVidWcg
ZmxhZy4KCgpJJ20gbm90IGRlbnlpbmcgdGhlIHBvc3NpYmlsaXR5IHRvIGZ1bGx5IG1pZ3JhdGUg
dG8gdGhlIGlvbWFwIHdheSwgYnV0CnRoYXQgd2lsbCBuZWVkIGEgbG90IG9mIGV4dHJhIHdvcmsg
bGlrZSBjbGVhbiB1cCB0aGUgY293X2ZpeHVwIHRoaW5nIHRvCnJlZHVjZSB0aGUgZXh0cmEgcGFn
ZSBmbGFnIHRyYWNraW5nIGZpcnN0LgooVGhhdCBhbHdheXMgY2F1c2VzIGEgbG90IG9mIGRpc2N1
c3Npb24gYnV0IHNlbGRvbWx5IGxlYWRzIHRvIHBhdGNoZXMpCgpUaGFua3MsClF1Cj4KPiBIbSwg
aXQgbWlnaHQgYmUgd29ydGggYWRkaW5nIGEga21hbGxvYy0xNjAsIHdlJ2QgZ2V0IDI1IG9iamVj
dHMgcGVyIDRLaUIKPiBwYWdlIGluc3RlYWQgb2YgMjEgMTkyLWJ5dGUgb2JqZWN0cyAuLi4KPgo+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
