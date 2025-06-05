Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E360ACECCE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Jun 2025 11:29:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ms/u2kUAcPyIVM//YGIBbiY7OaUmTa3y/mG13iaaj4I=; b=PkeDpX20u0blK08hfVyD1mct0t
	eq5tJSns9XJquw0KnHrXnLtarRVEnu0wajnOnpPOhOMNUwWLpasvHuZGfCu2SEyUzZwPeOPGNkefA
	zGYm7qwQ2nVhmtkbQTXLYwr0dyztLForyAnZ36AU4vlyf4quDBqb3tja/gukb/X8REEo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uN6uH-0007wq-83;
	Thu, 05 Jun 2025 09:29:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uN6uF-0007wj-A3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 09:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UofTGTTem9OPfW1U4FGdE3k6MxGykuBfRYOiQInD4Rg=; b=ABEtItifOcC6XxfuBsfbZVKJGq
 aCu4H/x9W2wPGhV3kbZuaYcWoIeOoftm1L33Rh6iPWnBDOXAXtu1xhETq31AYx/r4ylnpyK7E2UBA
 umoI7iD8Iej5TVc0CvNj1ZuXj5MI+hrnxme5QKz0/DKWEO24SUB10Ao2kHYoohSFKs4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UofTGTTem9OPfW1U4FGdE3k6MxGykuBfRYOiQInD4Rg=; b=NOmAcazbeTnkotDkhV1c/ThX8A
 sdHgWnjWcXx+ITH62RoT0BFGOK5vb1hP8Wsyon/7SGG8SRDDSxS/4THxZbcDC+MfFz9h6WNykiu4F
 fIBio2hK4yIx9kUliTCGCF6n3w7A4x/KfgOUkuNdLlOjTYAeKTAacT6epRZMMsXYgTyw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uN6uE-0004Ni-Ru for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 09:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 73A3D4A7F8;
 Thu,  5 Jun 2025 09:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD1FC4CEE7;
 Thu,  5 Jun 2025 09:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749115732;
 bh=zoZZxpeQQYm5sEswPLtefeq1AWGKvRbLomRnhuir7Sc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gAvr551LIWPo0DZuKQ7wN9adzQ4DFAChhWUB6CXkPOLTClkQicrfelq+Y6mS0w6UQ
 qZFC3V9p3QsHFxW1gAwT0fL3gsrmJKLJlaTVmh4cW8Du1+2minRGsrfnSLDFuY3PU5
 tJuG9xvtk7E47aBwNI4c9potKiSSXtyI5dpcnRQtmcSRI842/VRWLnsRulqW59OPK5
 bR6VLNrIBsevgZIZtNt1zsptsRi2TwNKO4dEYZPWw+PBw5N3rrjy1FJlX1Q7hhxVIB
 w74MU9AR2gBVYWGpeD3Vm6BXN278QFqVFv3BLEDCl8OlpW2WA6Stqul8yfHRBEWh6i
 IclBdSBB1osrA==
Message-ID: <b018b7b6-3e45-49cd-b146-02288ffedf1a@kernel.org>
Date: Thu, 5 Jun 2025 17:28:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <CAHJ8P3KgngtQdZP-fCOM-X5-16-JgRLYJeNFc2h4zNQu6uPS9g@mail.gmail.com>
 <ab8d88cb-bfb8-44eb-9cd8-89cf7216e728@kernel.org>
 <CAHJ8P3LuRQ8AgYYfMic44MmO7WeV0Y+CZ9DtMDMQMbmXzu2FqQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3LuRQ8AgYYfMic44MmO7WeV0Y+CZ9DtMDMQMbmXzu2FqQ@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 4/27/25 09:49, Zhiguo Niu wrote: > Hi Chao > > Chao Yu
   <chao@kernel.org> 于2025年4月25日周五 13:30写道： >> >> Zhiguo, >>
    >> On 4/25/25 13:11, Zhiguo Niu wrote: >>> Hi Chao and Jaegeuk, >> [...] 
 
 Content analysis details:   (-0.5 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uN6uE-0004Ni-Ru
Subject: Re: [f2fs-dev] f2fs node footer data corruption in Android device
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNC8yNy8yNSAwOTo0OSwgWmhpZ3VvIE5pdSB3cm90ZToKPiBIaSBDaGFvCj4gCj4gQ2hhbyBZ
dSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0NOaciDI15pel5ZGo5LqUIDEzOjMw5YaZ6YGT
77yaCj4+Cj4+IFpoaWd1bywKPj4KPj4gT24gNC8yNS8yNSAxMzoxMSwgWmhpZ3VvIE5pdSB3cm90
ZToKPj4+IEhpIENoYW8gYW5kIEphZWdldWssCj4+Pgo+Pj4gSSBlbmNvdW50ZXJlZCBhIHByb2Js
ZW0gd2l0aCBub2RlIGZvb3RlciBkYXRhIGJlaW5nIGNvcnJ1cHRlZCBvbiBhbgo+Pj4gQW5kcm9p
ZCBkZXZpY2UuKGtlcm5lbCB2ZXJzaW9uIDYuNiBhbmQgYW5kcm9pZCB2ZXJzaW9uOjE1KQo+Pj4g
YWZ0ZXIgSSBtZXJnZWQgdGhlIGZvbGxvd2luZyBwYXRjaGVzLCB0aGUgcHJvYmxlbSBzdGlsbCBl
eGlzdHMuCj4+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9qYWVnZXVrL2YyZnMtdG9vbHMuZ2l0L2NvbW1pdC8/aD1kZXYtdGVzdCZpZD1lYmEwODQxNGM1
ODVmOTA3NjBjNDMxMmY1N2RlYTc4ZWE0NWNiNWNiCj4+PiBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9qYWVnZXVrL2YyZnMuZ2l0L2NvbW1pdC9mcy9mMmZz
P2g9ZGV2LXRlc3QmaWQ9MTk0MjZjNDk4OGFhODUyOThjMWI0Y2FmMjg4OWQzN2VjNWM4MGZlYQo+
Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamFlZ2V1
ay9mMmZzLmdpdC9jb21taXQvZnMvZjJmcz9oPWRldi10ZXN0JmlkPWMyZWNiYTAyNjU4NmNkYTZj
N2RjMGZlOWU2ZTYwZTdlOTM4NmMzYmQKPj4+IGFuZCB0aGVyZSBpcyBubyBuYXRfYml0cyBpbiBt
b3VudCBvcHRpb24uCj4+Pgo+Pj4gSSBhbSBzdGlsbCBkZWJ1Z2dpbmcsIGFuZCB3b3VsZCBsaWtl
IHRvIGFzayBkbyB5b3UgaGF2ZSBhbnkgb3RoZXIKPj4+IGhpbnRzIG9yIHN1Z2dlc3Rpb25zPwo+
Pj4gVGhlIGlzc3VlIHNlZW0gdG8gYmUgY2xvc2VseSByZWxhdGVkIHRvIGFkYiByZW1vdW50Lgo+
Pj4KPj4+IHRlc3Qgc3RlcHM6Cj4+PiBwaW5nIDEyNy4wLjAuMSAtbiAyMCA+IG51bAo+Pj4gYWRi
LmV4ZSAtcyBteWRldmljZSAgd2FpdC1mb3ItZGV2aWNlCj4+PiBhZGIuZXhlICAtcyBteWRldmlj
ZSByZWJvb3QgYm9vdGxvYWRlcgo+Pj4gZmFzdGJvb3QgLXMgbXlkZXZpY2UgIGVyYXNlIHVzZXJk
YXRhCj4+PiBmYXN0Ym9vdCAtcyBteWRldmljZSAgZXJhc2UgY2FjaGUKPj4+IGZhc3Rib290IC1z
IG15ZGV2aWNlICByZWJvb3QKPj4+IHBpbmcgMTI3LjAuMC4xIC1uIDMwID4gbnVsCj4+PiBhZGIu
ZXhlIC1zIG15ZGV2aWNlIHdhaXQtZm9yLWRldmljZQo+Pj4gYWRiLmV4ZSAtcyBteWRldmljZSBy
b290Cj4+PiBhZGIuZXhlIC1zIG15ZGV2aWNlIHJlbW91bnQKPj4KPj4gQW55IGNoYW5nZSBmb3Ig
bW91bnQgb3B0aW9uPyBDYW4geW91IHByb3ZpZGUgbW91bnQgb3B0aW9uIGJlZm9yZS9hZnRlcgo+
PiByZW1vdW50Pwo+Pgo+Pj4gYWRiLmV4ZSAtcyBteWRldmljZSBzaGVsbCAgIHJtIC1yZiAvZGF0
YS9zb21lZmlsZS8qCj4+Cj4+IEhvdyBhYm91dCBlbmFibGluZyBhbGwgZjJmcyB0cmFjZXBvaW50
cyB0byBjYXRjaCBob3cgdGFyZ2V0IG5vZGUgd2FzCj4+IHVwZGF0ZWQ/Cj4gVGhhbmtzIGZvciB5
b3VyIHF1aWNrIGZlZWRiYWNrLCB0aGlzIGlzIGEgdXNlZnVsIHN1Z2dlc3Rpb24uCj4gVGhhbmtz
IGEgbG90LgoKSGkgWmhpZ3VvLAoKQ2FuIHRoaXMgdGVzdGNhc2UgcmVwcm9kdWNlIHRoZSBidWcg
c3RhYmx5PyBhbmQgYW55IHByb2dyZXNzIG9uIHRoaXMgaXNzdWU/CgpUaGFua3MsCgo+Pgo+PiBU
aGFua3MsCj4+Cj4+Pgo+Pj4gZG1lc2c6Cj4+PiBkbS01OTogdXNlcmRhdGEgcGFydGl0aW9uLCBk
bS03OiBzY3JhdGNoIGltYWdlIHBhcnRpdGlvbiBpcyBmb3IgYWRiIHJlbW91bnQKPj4+IFsgICAg
My44OTM2MzBdIEYyRlMtZnMgKGRtLTU5KTogVXNpbmcgZW5jb2RpbmcgZGVmaW5lZCBieSBzdXBl
cmJsb2NrOgo+Pj4gdXRmOC0xMi4xLjAgd2l0aCBmbGFncyAweDAKPj4+IFsgICAgMy45MzAyMTNd
IEYyRlMtZnMgKGRtLTU5KTogTW91bnRlZCB3aXRoIGNoZWNrcG9pbnQgdmVyc2lvbiA9IDM4NDg1
YjJkCj4+PiBbICAgMjAuNTg0MTY5XSBGMkZTLWZzIChkbS03KTogTW91bnRlZCB3aXRoIGNoZWNr
cG9pbnQgdmVyc2lvbiA9IDQyMTMwZWYKPj4+IFsgICAzOC4wMzkxMjJdIEYyRlMtZnMgKGRtLTU5
KTogaW5jb25zaXN0ZW50IG5vZGUgYmxvY2ssIG5pZDoxNDI2LAo+Pj4gbm9kZV9mb290ZXJbbmlk
OjEyOTU2NTAyMSxpbm86Mjc1NjA2MjI5OCxvZnM6MjY3ODI4NDUsY3B2ZXI6NjQyMTcwMzE2NTE3
OTgyNjkxMixibGthZGRyOjM1Nzc4NTExNDddCj4+PiBbICAgMzguMDQ4MzEwXSBGMkZTLWZzIChk
bS01OSk6IGluY29uc2lzdGVudCBub2RlIGJsb2NrLCBuaWQ6MTQyNiwKPj4+IG5vZGVfZm9vdGVy
W25pZDoxMjk1NjUwMjEsaW5vOjI3NTYwNjIyOTgsb2ZzOjI2NzgyODQ1LGNwdmVyOjY0MjE3MDMx
NjUxNzk4MjY5MTIsYmxrYWRkcjozNTc3ODUxMTQ3XQo+Pj4gWyAgIDM4LjA1MTcyNV0gRjJGUy1m
cyAoZG0tNTkpOiBpbmNvbnNpc3RlbnQgbm9kZSBibG9jaywgbmlkOjE0MjYsCj4+PiBub2RlX2Zv
b3RlcltuaWQ6MTI5NTY1MDIxLGlubzoyNzU2MDYyMjk4LG9mczoyNjc4Mjg0NSxjcHZlcjo2NDIx
NzAzMTY1MTc5ODI2OTEyLGJsa2FkZHI6MzU3Nzg1MTE0N10KPj4+IHRoYW5rcwo+PgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
