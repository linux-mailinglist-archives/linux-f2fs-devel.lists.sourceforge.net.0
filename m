Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC1E8B4394
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Apr 2024 03:49:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s0XC8-0008S7-Cq;
	Sat, 27 Apr 2024 01:49:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s0XC6-0008S1-HM
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Apr 2024 01:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k6AwO28dfGnyw0t3m8S1N82JIakPgPIEBinvDerSa0A=; b=lYBwWYjXSvR5Mf2obrGKQTf4FQ
 +tfuQ63+gsWLguc8g/1evHGo9MMXCQ8GKJ00H/mefkiu1en/awNyOspYg/Dk4dMW0QyUaEQX/W1mT
 cuztgTx0obzdLRxJ05IHQlCKXxG3JbGO48Byf3zoXMfbXyXNvdVt9MoQo36gYAef0AyQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k6AwO28dfGnyw0t3m8S1N82JIakPgPIEBinvDerSa0A=; b=mWows2TXe6pmVszTnCy9rZSNRy
 CFO6ZieDZDdxrqUG0FjSQ836+hS0QL/z68JLqDv90Lr4L4IpRgNxzvUnEwK6LpLAWrswae1eXNUcZ
 TVgnJtLaCxhkNRGqruC5j0w1xxOlAzNEj52BHArpU1cAu71PVYfEvknmmmJuULV1Yus0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s0XC5-0005Mn-82 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Apr 2024 01:49:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DEB51CE1C64;
 Sat, 27 Apr 2024 01:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB91FC113CD;
 Sat, 27 Apr 2024 01:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714182564;
 bh=ApuNmjFgojFljBuMmz4JnZ1XqXgd90G4vsgN0MGa/rM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UEy5ISWNdc0Di8uBUD2ZEWqhhMrSCzr7vMPQygFci0M04z10CPXpQJQXmSLNI/XEr
 wLQu1SXwjlG2k6ahSGOsyanf7pHFnyeB1g+ugVK5PyN/PmORpHOf4oLtIsCzjul+Sj
 iNr2+vtec3nPAva0JoHB/j7eCRdViglZWOQtDiJ++dw3mqdYYZBkmFjRHJOUeH90fA
 Xml+PNE9FV3XwN1FXj6PEJAG6GfTvJUMdUxX/4wwfJSC+782ytqB8q3edVRxGg2P27
 BwKIA5y79bIPMfSb4JVlL5axdQIIm4hX0jbLoKkRDXo32y8+RPt4HepmDkNkFKaHlF
 t/xaQEQfrzlIA==
Message-ID: <a08a091b-78d1-4fb1-982c-c51d9dff8f06@kernel.org>
Date: Sat, 27 Apr 2024 09:49:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20240426103528.406063-1-chao@kernel.org>
 <CACOAw_xiC08JTanBSLaBED8_zveCEhoaDWeJ3YVU0h9+dNkQUg@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <CACOAw_xiC08JTanBSLaBED8_zveCEhoaDWeJ3YVU0h9+dNkQUg@mail.gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/4/26 22:14, Daeho Jeong wrote: > On Fri, Apr 26, 2024
    at 3:35 AM Chao Yu <chao@kernel.org> wrote: >> >> Otherwise, it breaks
   pinfile's sematics. >> >> Cc: Daeho Jeong <daeho43@gmail.com> >> [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s0XC5-0005Mn-82
Subject: Re: [f2fs-dev] [PATCH] f2fs: zone: fix to don't trigger OPU on
 pinfile for direct IO
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

T24gMjAyNC80LzI2IDIyOjE0LCBEYWVobyBKZW9uZyB3cm90ZToKPiBPbiBGcmksIEFwciAyNiwg
MjAyNCBhdCAzOjM14oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
T3RoZXJ3aXNlLCBpdCBicmVha3MgcGluZmlsZSdzIHNlbWF0aWNzLgo+Pgo+PiBDYzogRGFlaG8g
SmVvbmcgPGRhZWhvNDNAZ21haWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiAgIGZzL2YyZnMvZGF0YS5jIHwgMyArKy0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+IGluZGV4IGJlZTFlNDVmNzZi
OC4uZTI5MDAwZDgzZDUyIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+PiArKysgYi9m
cy9mMmZzL2RhdGEuYwo+PiBAQCAtMTU5Niw3ICsxNTk2LDggQEAgaW50IGYyZnNfbWFwX2Jsb2Nr
cyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsIGludCBm
bGFnKQo+Pgo+PiAgICAgICAgICAvKiB1c2Ugb3V0LXBsYWNlLXVwZGF0ZSBmb3IgZGlyZWN0IElP
IHVuZGVyIExGUyBtb2RlICovCj4+ICAgICAgICAgIGlmIChtYXAtPm1fbWF5X2NyZWF0ZSAmJgo+
PiAtICAgICAgICAgICAoaXNfaG9sZSB8fCAoZjJmc19sZnNfbW9kZShzYmkpICYmIGZsYWcgPT0g
RjJGU19HRVRfQkxPQ0tfRElPKSkpIHsKPj4gKyAgICAgICAgICAgKGlzX2hvbGUgfHwgKGZsYWcg
PT0gRjJGU19HRVRfQkxPQ0tfRElPICYmIChmMmZzX2xmc19tb2RlKHNiaSkgJiYKPj4gKyAgICAg
ICAgICAgKCFmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpIHx8ICFmMmZzX2lzX3Bpbm5lZF9maWxl
KGlub2RlKSkpKSkpIHsKPj4gICAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoZjJmc19jcF9l
cnJvcihzYmkpKSkgewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gLUVJTzsKPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gc3luY19vdXQ7Cj4+IC0tCj4+IDIuNDAuMQo+
IAo+IFNvLCB3ZSBibG9jayBvdmVyd3JpdGUgaW8gZm9yIHRoZSBwaW5maWxlIGhlcmUuCgpJIGd1
ZXNzIHlvdSBtZWFuIHdlIGJsb2NrZWQgYXBwZW5kIHdyaXRlIGZvciBwaW5maWxlLCByaWdodD8K
Cj4gCj4gc3RhdGljIHNzaXplX3QgZjJmc19maWxlX3dyaXRlX2l0ZXIoc3RydWN0IGtpb2NiICpp
b2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKmZyb20pCj4gCj4gewo+IC4uLgo+ICAgICAgICAgIGlmIChm
MmZzX2lzX3Bpbm5lZF9maWxlKGlub2RlKSAmJgo+ICAgICAgICAgICAgICAhZjJmc19vdmVyd3Jp
dGVfaW8oaW5vZGUsIHBvcywgY291bnQpKSB7CgpJZiAhZjJmc19vdmVyd3JpdGVfaW8oKSBpcyB0
cnVlLCBpdCBtZWFucyBpdCBtYXkgdHJpZ2dlciBhcHBlbmQgd3JpdGUgb24KcGluZmlsZT8KClRo
YW5rcywKCj4gICAgICAgICAgICAgICAgICByZXQgPSAtRUlPOwo+ICAgICAgICAgICAgICAgICAg
Z290byBvdXRfdW5sb2NrOwo+ICAgICAgICAgIH0KPiAKPiAKPj4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
