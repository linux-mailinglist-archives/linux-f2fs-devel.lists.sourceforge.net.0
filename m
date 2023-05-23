Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9095A70D9BD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 May 2023 11:59:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1Oo1-00045p-0v;
	Tue, 23 May 2023 09:59:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q1Onz-00045j-CF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 09:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zOIp89+A2i7MVwVMTr7aopCpOu+qOTDFbhFu0Oy0GLo=; b=J4lRoodQzeUpF0M1bYtOXK1Qjb
 mArl+cO5uECYgQdvkcnOHMBly9fgfP58beLkWNh/tA1fOfmh1bg0t4O4PaWxVhPbnreq15AZtSug2
 o6FsYpg+REFpM/jTB19WDUURuVpji/5WoyFv+zfbyyoHRv3JlXrm7Ak//CC/3ThT/eAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zOIp89+A2i7MVwVMTr7aopCpOu+qOTDFbhFu0Oy0GLo=; b=LjF5k9InPx0u2U3aiPpnVkNJ8F
 D60wuBOrkcC+q9CPqyeCtkz7aaaAHvJyi51gFS6xMzDqbQXmdrQHwJV6Yq5wNEP0K8LqeaUWebiuB
 RGcaiUGP3xcsW3Cfuai5ml1YdilfdJuZvSRld2gQuzOe9ap998RE+p7jc/619Nnp+AOc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1Onx-000M3n-ON for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 09:59:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0262C61C37;
 Tue, 23 May 2023 09:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9373FC433EF;
 Tue, 23 May 2023 09:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684835975;
 bh=GrRcIHDO1SDLHVKhQFXK8lRnkO2ESuSEmkZuwO2dL2g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YymbfvCihZzeyIwMc3HKO4EFwviM+I+OLwbj22lMoluLs5Jvg+6tE/cpGZ0Fk++LZ
 mV6OmRnfcjlg4aT+66w1Tg2PNsFqc4YPxgushjJrH1hooyGxEgAZ3KQ0HbYPv6jdLS
 i5sxzJh0btVYvvIMvPuWhnZQaV03cHb7boNTjLamsJpIYmE+kt4mx+rJ09oCtWe8nN
 eVLKHV/C6+FzlBGsWKktcih2iqk9aoxfid5XTzPkfkI+ZKotleuq2a/kd3j6fzl+Py
 b+IC3OGNQBGRWslaWGz3+NJiD7V0uH0C2VES+aJEb4BqI8DxZpDZErabdFDeuq5S8c
 E0NOKY0SG0dsQ==
Message-ID: <d4a7bc42-6b58-27e3-e9d8-950f698bc43f@kernel.org>
Date: Tue, 23 May 2023 17:59:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: zangyangyang1 <zangyangyang1@xiaomi.com>, jaegeuk@kernel.org
References: <20230523072421.1616607-1-zangyangyang1@xiaomi.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230523072421.1616607-1-zangyangyang1@xiaomi.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/23 15:24, zangyangyang1 wrote: > When using fiemap
 to obtain the block address of files > larger than 2GB ((2147483647+1) bytes), 
 an integer > multiplication overflow error will occur. > Thi [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q1Onx-000M3n-ON
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: Fix integer multiplication overflow
 error in fiemap
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy81LzIzIDE1OjI0LCB6YW5neWFuZ3lhbmcxIHdyb3RlOgo+IFdoZW4gdXNpbmcgZmll
bWFwIHRvIG9idGFpbiB0aGUgYmxvY2sgYWRkcmVzcyBvZiBmaWxlcwo+IGxhcmdlciB0aGFuIDJH
QiAoKDIxNDc0ODM2NDcrMSkgYnl0ZXMpLCBhbiBpbnRlZ2VyCj4gbXVsdGlwbGljYXRpb24gb3Zl
cmZsb3cgZXJyb3Igd2lsbCBvY2N1ci4KPiBUaGlzIGlzc3VlIGlzIGNhdXNlZCBieSB0aGUgZm9s
bG93aW5nIGNvZGU6Cj4gICAgICBzdGFydCA9IGF0b2koYXJndlsxXSkgKiBGMkZTX0JMS1NJWkU7
Cj4gICAgICBsZW5ndGggPSBhdG9pKGFyZ3ZbMl0pICogRjJGU19CTEtTSVpFOwo+IAo+IFNpZ25l
ZC1vZmYtYnk6IHphbmd5YW5neWFuZzEgPHphbmd5YW5neWFuZzFAeGlhb21pLmNvbT4KPiAtLS0K
PiAgIHRvb2xzL2YyZnNfaW8vZjJmc19pby5jIHwgMTAgKysrKystLS0tLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvZjJmc19pby9mMmZzX2lvLmMgYi90b29scy9mMmZzX2lvL2YyZnNfaW8uYwo+IGluZGV4
IDViYzBiYWYuLmFkNmI1ZjAgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMK
PiArKysgYi90b29scy9mMmZzX2lvL2YyZnNfaW8uYwo+IEBAIC04MDksMTUgKzgwOSwxNSBAQCBz
dGF0aWMgdm9pZCBkb19maWVtYXAoaW50IGFyZ2MsIGNoYXIgKiphcmd2LCBjb25zdCBzdHJ1Y3Qg
Y21kX2Rlc2MgKmNtZCkKPiAgICAgICAgICB9Cj4gCj4gICAgICAgICAgbWVtc2V0KGZtLCAwLCBz
aXplb2Yoc3RydWN0IGZpZW1hcCkpOwo+IC0gICAgICAgc3RhcnQgPSBhdG9pKGFyZ3ZbMV0pICog
RjJGU19CTEtTSVpFOwo+IC0gICAgICAgbGVuZ3RoID0gYXRvaShhcmd2WzJdKSAqIEYyRlNfQkxL
U0laRTsKCkhvdyBhYm91dD8KCnN0YXJ0ID0gKGxvbmcgbG9uZylhdG9pKGFyZ3ZbMV0pICogRjJG
U19CTEtTSVpFOwpsZW5ndGggPSAobG9uZyBsb25nKWF0b2koYXJndlsyXSkgKiBGMkZTX0JMS1NJ
WkU7CgpUaGFua3MsCgo+IC0gICAgICAgZm0tPmZtX3N0YXJ0ID0gc3RhcnQ7Cj4gLSAgICAgICBm
bS0+Zm1fbGVuZ3RoID0gbGVuZ3RoOwo+ICsgICAgICAgc3RhcnQgPSBhdG9sbChhcmd2WzFdKTsK
PiArICAgICAgIGxlbmd0aCA9IGF0b2xsKGFyZ3ZbMl0pOwo+ICsgICAgICAgZm0tPmZtX3N0YXJ0
ID0gc3RhcnQgKiBGMkZTX0JMS1NJWkU7Cj4gKyAgICAgICBmbS0+Zm1fbGVuZ3RoID0gbGVuZ3Ro
ICogRjJGU19CTEtTSVpFOwo+IAo+ICAgICAgICAgIGZkID0geG9wZW4oYXJndlszXSwgT19SRE9O
TFkgfCBPX0xBUkdFRklMRSwgMCk7Cj4gCj4gICAgICAgICAgcHJpbnRmKCJGaWVtYXA6IG9mZnNl
dCA9ICUiUFJJdTY0IiBsZW4gPSAlIlBSSXU2NCJcbiIsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdGFydCAvIEYyRlNfQkxLU0laRSwgbGVuZ3RoIC8gRjJGU19CTEtTSVpFKTsK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXJ0LCBsZW5ndGgpOwo+ICAgICAg
ICAgIGlmIChpb2N0bChmZCwgRlNfSU9DX0ZJRU1BUCwgZm0pIDwgMCkKPiAgICAgICAgICAgICAg
ICAgIGRpZV9lcnJubygiRklFTUFQIGZhaWxlZCIpOwo+IAo+IC0tCj4gMi40MC4xCj4gCj4gIy8q
KioqKirmnKzpgq7ku7blj4rlhbbpmYTku7blkKvmnInlsI/nsbPlhazlj7jnmoTkv53lr4bkv6Hm
ga/vvIzku4XpmZDkuo7lj5HpgIHnu5nkuIrpnaLlnLDlnYDkuK3liJflh7rnmoTkuKrkurrmiJbn
vqTnu4TjgILnpoHmraLku7vkvZXlhbbku5bkurrku6Xku7vkvZXlvaLlvI/kvb/nlKjvvIjljIXm
i6zkvYbkuI3pmZDkuo7lhajpg6jmiJbpg6jliIblnLDms4TpnLLjgIHlpI3liLbjgIHmiJbmlaPl
j5HvvInmnKzpgq7ku7bkuK3nmoTkv6Hmga/jgILlpoLmnpzmgqjplJnmlLbkuobmnKzpgq7ku7bv
vIzor7fmgqjnq4vljbPnlLXor53miJbpgq7ku7bpgJrnn6Xlj5Hku7bkurrlubbliKDpmaTmnKzp
gq7ku7bvvIEgVGhpcyBlLW1haWwgYW5kIGl0cyBhdHRhY2htZW50cyBjb250YWluIGNvbmZpZGVu
dGlhbCBpbmZvcm1hdGlvbiBmcm9tIFhJQU9NSSwgd2hpY2ggaXMgaW50ZW5kZWQgb25seSBmb3Ig
dGhlIHBlcnNvbiBvciBlbnRpdHkgd2hvc2UgYWRkcmVzcyBpcyBsaXN0ZWQgYWJvdmUuIEFueSB1
c2Ugb2YgdGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBoZXJlaW4gaW4gYW55IHdheSAoaW5jbHVk
aW5nLCBidXQgbm90IGxpbWl0ZWQgdG8sIHRvdGFsIG9yIHBhcnRpYWwgZGlzY2xvc3VyZSwgcmVw
cm9kdWN0aW9uLCBvciBkaXNzZW1pbmF0aW9uKSBieSBwZXJzb25zIG90aGVyIHRoYW4gdGhlIGlu
dGVuZGVkIHJlY2lwaWVudChzKSBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGUt
bWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHBob25lIG9yIGVtYWls
IGltbWVkaWF0ZWx5IGFuZCBkZWxldGUgaXQhKioqKioqLyMKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
