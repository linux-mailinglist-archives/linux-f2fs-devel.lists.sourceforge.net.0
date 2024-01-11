Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0313A82A591
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 02:33:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNjwv-0002IT-2k;
	Thu, 11 Jan 2024 01:33:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rNjwt-0002IN-Pp
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 01:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KFBZnLePJgAkY6uUhTdh6q1GUW3WRiGUDJzt4U75XyY=; b=Cn7D7k56dT03oQowNxVxqT8b6T
 Snxsprkq5x+//CwD4j14yXyahQeHn/jULJtxZcNpOxWd2laBX5w/BIFH8xQ4m0VAHzhy76doy7gKL
 Uk5KBeLOS4cGJU5fwepBFhvgr+WSYJQizJmtaA4zvw0JJTcLANwdOMdvPgzHYVg9Uhvk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KFBZnLePJgAkY6uUhTdh6q1GUW3WRiGUDJzt4U75XyY=; b=inDwwl9Q5pWsA/zVU2GC8+ELFd
 m6f44ttIvlFZ221k4qr1n52dzl6uG8/f68l9nPCeieerrCI2XMGw+0eose7q19U7FZi/Cs58ejX4Q
 ajr0LVjC5GQbwAOUTPMTxt0anWeUmFj4xz7zHIiavIg09y0RmBDHpGLMPVMDyxuuXv34=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rNjwm-0002pf-EH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 01:33:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3898661947;
 Thu, 11 Jan 2024 01:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103DBC433C7;
 Thu, 11 Jan 2024 01:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704936796;
 bh=s0lQMwjpjbzCiToFVB40JTvmIeU+wECrc+VCMfehSW4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EHT/mtifffgH7aCZm8gtAW5stnregXiHGg+IzlQwEolwUaqyyShCE1k6xcQQtJZVy
 y9F+HqZv65UrXIe/GFDeMYzo0TcNoU25Hz9kDm4XkKP2Z/Grb+NS8JlnrdlRLz/Pwd
 2bXCLUXIf6ch2GafcdGmsDqSTK7tCZ7ShF0xHF2pxR9IDqxW2ov8eFfD/8dUsgUH7x
 LJEoUzZLPlaokeGAuf22h2ixrBclEoCjVHxWHcg6V0uMsCVEugTtlkS0EwlYp5AKQq
 U4uaTyNCW+t4gFNKS3Qqv8y4J4nitZbTw74kId6mvlEOzlWH6zRywWyVsql1LryFmO
 UUdwJa9FL5rUw==
Message-ID: <e7f4a835-6a4c-4f94-a79f-a425b04516e2@kernel.org>
Date: Thu, 11 Jan 2024 09:33:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>
References: <20231228143152.1543509-1-chao@kernel.org>
 <20231228143152.1543509-3-chao@kernel.org>
 <CACOAw_xCfOtJaC3FbOhvbrEzyUwecdSujFo4-f--dz+33BC+Sg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <CACOAw_xCfOtJaC3FbOhvbrEzyUwecdSujFo4-f--dz+33BC+Sg@mail.gmail.com>
X-Spam-Score: -7.0 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/1/11 9:18, Daeho Jeong wrote: > On Thu, Dec 28, 2023
    at 6:33 AM Chao Yu <chao@kernel.org> wrote: >> >> From: Sheng Yong <shengyong@oppo.com>
    >> >> Compressed cluster may not be released due [...] 
 
 Content analysis details:   (-7.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rNjwm-0002pf-EH
Subject: Re: [f2fs-dev] [PATCH v3 3/6] f2fs: compress: fix to check
 unreleased compressed cluster
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xLzExIDk6MTgsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIFRodSwgRGVjIDI4LCAy
MDIzIGF0IDY6MzPigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBG
cm9tOiBTaGVuZyBZb25nIDxzaGVuZ3lvbmdAb3Bwby5jb20+Cj4+Cj4+IENvbXByZXNzZWQgY2x1
c3RlciBtYXkgbm90IGJlIHJlbGVhc2VkIGR1ZSB0byB3ZSBjYW4gZmFpbCBpbgo+PiByZWxlYXNl
X2NvbXByZXNzX2Jsb2NrcygpLCBmaXggdG8gaGFuZGxlIHJlc2VydmVkIGNvbXByZXNzZWQKPj4g
Y2x1c3RlciBjb3JyZWN0bHkgaW4gcmVzZXJ2ZV9jb21wcmVzc19ibG9ja3MoKS4KPj4KPj4gRml4
ZXM6IDRjOGZmNzA5NWJlZiAoImYyZnM6IHN1cHBvcnQgZGF0YSBjb21wcmVzc2lvbiIpCj4+IFNp
Z25lZC1vZmYtYnk6IFNoZW5nIFlvbmcgPHNoZW5neW9uZ0BvcHBvLmNvbT4KPj4gU2lnbmVkLW9m
Zi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+PiAtLS0KPj4gICBmcy9mMmZzL2ZpbGUu
YyB8IDEyICsrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+IGlu
ZGV4IDAyNmQwNWE3ZWRkOC4uNzgyYWUzYmU0OGY2IDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2Zp
bGUuYwo+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+PiBAQCAtMzYyNCw2ICszNjI0LDE1IEBAIHN0
YXRpYyBpbnQgcmVzZXJ2ZV9jb21wcmVzc19ibG9ja3Moc3RydWN0IGRub2RlX29mX2RhdGEgKmRu
LCBwZ29mZl90IGNvdW50KQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IG5leHQ7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4+Cj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgIC8qCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIGNvbXByZXNzZWQgY2x1
c3RlciB3YXMgbm90IHJlbGVhc2VkIGR1ZSB0bwo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
KiBpdCBmYWlscyBpbiByZWxlYXNlX2NvbXByZXNzX2Jsb2NrcygpLgo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgKi8KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGJsa2FkZHIgPT0g
TkVXX0FERFIpIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wcl9ibG9j
a3MrKzsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgfQo+PiArCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoX19pc192YWxpZF9kYXRhX2Jsa2FkZHIoYmxrYWRkcikpIHsKPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29tcHJfYmxvY2tzKys7Cj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwo+IAo+IEhvdyBhYm91dCBtZXJnaW5nIHR3byBjb25kaXRp
b25zIGxpa2UgImJsa2FkZHIgPT0gTkVXX0FERFIgfHwKPiBfX2lzX3ZhbGlkX2RhdGFfYmxrYWRk
cihibGthZGRyKSI/CgpPaCwgc3VyZS4KCj4gCj4+IEBAIC0zNjMzLDYgKzM2NDIsOSBAQCBzdGF0
aWMgaW50IHJlc2VydmVfY29tcHJlc3NfYmxvY2tzKHN0cnVjdCBkbm9kZV9vZl9kYXRhICpkbiwg
cGdvZmZfdCBjb3VudCkKPj4gICAgICAgICAgICAgICAgICB9Cj4+Cj4+ICAgICAgICAgICAgICAg
ICAgcmVzZXJ2ZWQgPSBjbHVzdGVyX3NpemUgLSBjb21wcl9ibG9ja3M7Cj4+ICsgICAgICAgICAg
ICAgICBpZiAoIXJlc2VydmVkKQo+PiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7
Cj4+ICsKPiAKPiBIb3cgY2FuIHRoZSByZXNlcnZlZCB2YXJpYWJsZSBiZSB6ZXJvPwoKSSBndWVz
cyBpdCBjYW4gaGFwcGVuIGlmIGEgY2x1c3RlciB3YXMgbm90IHJlbGVhc2VkIGR1cmluZwpyZWxl
YXNlX2NvbXByZXNzX2Jsb2NrcygpLCB0aGVuIGFsbCBibG9ja3MgaW4gdGhlIGNsdXN0ZXIgc2hv
dWxkCmhhcyBiZWVuIHJlc2VydmVkLCBzbywgaW4gdGhpcyByb3VuZCBvZiByZXNlcnZpbmcsIGl0
IG5lZWRzIHRvIHNraXAKcmVzZXJ2ZSBibG9ja3MsIHJpZ2h0PwoKVGhhbmtzLAoKPiAKPj4gICAg
ICAgICAgICAgICAgICByZXQgPSBpbmNfdmFsaWRfYmxvY2tfY291bnQoc2JpLCBkbi0+aW5vZGUs
ICZyZXNlcnZlZCk7Cj4+ICAgICAgICAgICAgICAgICAgaWYgKHJldCkKPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4+IC0tCj4+IDIuNDAuMQo+Pgo+Pgo+Pgo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
