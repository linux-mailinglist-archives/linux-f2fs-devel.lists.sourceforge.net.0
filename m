Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A082369560C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Feb 2023 02:43:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRkLf-00081Q-R5;
	Tue, 14 Feb 2023 01:43:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pRkLe-00081J-9S
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 01:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nDBt5M+1/XKR3jBbj+KR7Xmpq4nG58/1LQM3prYavm8=; b=hpeh9/LDYIE8ozWwJHsIaUp9kQ
 74XBkjuF333QdAgK5x3O73Sm2Ak8UwnIfVw/UU/JnrUoBUtt+6Y+yDSr8bVEwYfSo7LwblnZk76zQ
 f2GWHmpZz5xHjNN7ITYRak1QLuCxNZa3IGBrUZbuYXZCFQanDkzYXyzmLCDH4RIGnwt4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nDBt5M+1/XKR3jBbj+KR7Xmpq4nG58/1LQM3prYavm8=; b=mBNPMNlxJ09AlOYfUMY/vvnr5E
 fZwAE1CCP2AuSH3/0/d2j9NSC+G2REV7aDuB2hd9ZeCi/O1EooXuwaqUPeXpfBAVS798CeCWWxYeG
 6hZQzP3q8f9ebG6vIeLYsCXC8Tyipdw2a2P4kUMXB6F5DnCcf6Zd8R+kN206lPixUqT8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRkLc-000572-0y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 01:43:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4291BB819EF;
 Tue, 14 Feb 2023 01:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6FCC433D2;
 Tue, 14 Feb 2023 01:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676338977;
 bh=7Aw+lFf2GKn1e8zcJaIaZ6GDRglUt/eLL0AZcc4QVWs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ltjtaO08iIIGLhYLCILTc/8YmAIm758+wWAxwNnQ2Si3Gp6AvKZ3Lt5NEEHz7oSY+
 yUl0GMQLhpBQwhUAMRCj/SraasE3MHsXPeyu4ZHYMqm+XmOsi/ln7LnXSgGfY4ccmZ
 fc+j0v+nxpChI46RsnDghdvhc+XjaNfbkRxeUjexMX2/Lg3Xe3p8Oq0BLJcU6PFVj2
 Rza5wXqOBJabAHX2QD3h4zGemXVMuRL5F9DYhYR0jvoJl7TM6cOE3VUtF9gveU0lUU
 UsSBmvwF5NYMlw32BXLkUKsVRPE74mYm2VrsPjSOvGNPhDyjJRM6nwWQGys1+SEpGT
 q8nflKkKXDlwQ==
Message-ID: <abb12474-f338-dedf-115b-da70e4946cec@kernel.org>
Date: Tue, 14 Feb 2023 09:42:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230209-kobj_type-f2fs-v1-1-b6feedbdd4a8@weissschuh.net>
 <cc338b66-f0f5-d9b7-81d3-b15bccc9d463@kernel.org>
 <Y+p4jezz5asWoPhu@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y+p4jezz5asWoPhu@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/2/14 1:51, Jaegeuk Kim wrote: > On 02/13, Chao Yu
   wrote: >> On 2023/2/9 11:20, Thomas Weißschuh wrote: >>> Since commit ee6d3dd4ed48
    ("driver core: make kobj_type constant.") >>> the driver c [...] 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRkLc-000572-0y
Subject: Re: [f2fs-dev] [PATCH] f2fs: make kobj_type structures constant
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
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy8yLzE0IDE6NTEsIEphZWdldWsgS2ltIHdyb3RlOgo+IE9uIDAyLzEzLCBDaGFvIFl1
IHdyb3RlOgo+PiBPbiAyMDIzLzIvOSAxMToyMCwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cj4+
PiBTaW5jZSBjb21taXQgZWU2ZDNkZDRlZDQ4ICgiZHJpdmVyIGNvcmU6IG1ha2Uga29ial90eXBl
IGNvbnN0YW50LiIpCj4+PiB0aGUgZHJpdmVyIGNvcmUgYWxsb3dzIHRoZSB1c2FnZSBvZiBjb25z
dCBzdHJ1Y3Qga29ial90eXBlLgo+Pj4KPj4+IFRha2UgYWR2YW50YWdlIG9mIHRoaXMgdG8gY29u
c3RpZnkgdGhlIHN0cnVjdHVyZSBkZWZpbml0aW9ucyB0byBwcmV2ZW50Cj4+PiBtb2RpZmljYXRp
b24gYXQgcnVudGltZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8
bGludXhAd2Vpc3NzY2h1aC5uZXQ+Cj4+Cj4+IFJldmlld2VkLWJ5OiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+Cj4gCj4gSGkgQ2hhbywKPiAKPiBOb3RlIHRoYXQsIG5leHQgdGltZSwgSSB3b24n
dCBhcHBseS9tb2RpZnkgYW55IHBhdGNoZXMgbWVyZ2VkIGluIC1kZXYsCj4gdW5sZXNzIGl0IGhh
cyBhIHByb2JsZW0uCgpIaSBKYWVnZXVrLAoKT2gsIGFueSBwYXJ0aWN1bGFyIHJlYXNvbiwgdG8g
YXZvaWQgdW5uZWVkZWQgY29tbWl0IGlkIGNoYW5nZSB3aGVuIHRoZSB0aW1lIGlzCmNsb3NlIHRv
IG1lcmdlIHdpbmRvdz8KCklzIHRoZXJlIGFueSBwZXJpb2Qgb2YgZ3JhY2UgYmVmb3JlIG1lcmdp
bmcgcGF0Y2hlcyBmcm9tIGRldi10ZXN0IGJyYW5jaCBpbnRvIGRldgpicmFuY2g/IE1heWJlIGEg
d2VlayBpcyByZWFzb25hYmxlPyBzbyBJIG1heSBoYXZlIHRpbWUgdG8gY2F0Y2ggdXAgaW4gdGlt
ZS4KClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+IAo+Pgo+PiBUaGFua3MsCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
