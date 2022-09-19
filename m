Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 683395BD653
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Sep 2022 23:25:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaOGE-00035y-5J;
	Mon, 19 Sep 2022 21:25:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.santos@pobox.com>) id 1oaOFw-00035T-DG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 21:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RdnGLNKCh9KRkDq3DITV2n7BWXPzOCdylObA9ftkmR4=; b=FkcX8Eohv2iCUzbUeSYW4bceJQ
 WdVAFV64wbUcJbYSxPH7tnB1LwCfGOXC8YtFB5btheCc+550L6FPg3ZT4Dc+YtOlFlWW1TNyX6M2l
 86XAkSbgE1f00wYoMQozf3uFcUbAN+KifS+19DIPoYX0GROiL2gCIiK3nx3QFNHoXC3o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RdnGLNKCh9KRkDq3DITV2n7BWXPzOCdylObA9ftkmR4=; b=cMDTk7Ll+4JESzfi5Tes6eDsxn
 mh7gMfPTeTxOR61vXiVBG3bdQcoQer436VgGf6T1VLrChEOR3UCx89FlMFKOacujRbwDB2tHRMQVZ
 FwUq8iOIF6J35uDD3Z6XMhHGo3CEom+SoLATEMjgo0NZhhfCYGdecKf4VpVVNFgD5I24=;
Received: from pb-smtp2.pobox.com ([64.147.108.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oaOFv-0001iJ-MT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 21:24:44 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id E61BC141DF8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Sep 2022 17:06:23 -0400 (EDT)
 (envelope-from daniel.santos@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=message-id
 :date:mime-version:subject:to:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=sasl; bh=RdnGLNKCh9KR
 kDq3DITV2n7BWXPzOCdylObA9ftkmR4=; b=sqb/8CLCD+Xmjn1ioxLNtDSi4Fwl
 /GgB2s/GT2kPXxfwcgc21nshFAdKMHkpQFl3vSfv1O8IBpMLQgZ51ZX8pJygOz5U
 4emCwdCFvmRVFkNYADTGBza1bL6YxobmZwbwss+rIvM7RLcfAKnFvpQ6rdscSFjb
 fwbwoUDkU7dgweI=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id DD573141DF7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Sep 2022 17:06:23 -0400 (EDT)
 (envelope-from daniel.santos@pobox.com)
Received: from [192.168.0.8] (unknown [70.122.34.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 59A40141DF6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Sep 2022 17:06:23 -0400 (EDT)
 (envelope-from daniel.santos@pobox.com)
Message-ID: <8e752829-ead3-c342-d5fd-94eef044be53@pobox.com>
Date: Mon, 19 Sep 2022 16:06:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: linux-f2fs-devel@lists.sourceforge.net
References: <E1oaIZQ-0004LJ-6v@sfs-ml-1.v29.lw.sourceforge.com>
From: Daniel Santos <daniel.santos@pobox.com>
In-Reply-To: <E1oaIZQ-0004LJ-6v@sfs-ml-1.v29.lw.sourceforge.com>
X-Pobox-Relay-ID: EAB7EC36-385E-11ED-8CF6-307A8E0A682E-06139138!pb-smtp2.pobox.com
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Awesome!  Now we can afford to develop that new additive,
    background compression optimization with the shared dictionary objects! On
    9/19/22 09:39, Christine Weir wrote: > Make use of this $640,000 donation
    offer from me to you. Email me for more details: > > I anticipate your earliest
    response. > Christine Weir > Chairman Weir [...] 
 
 Content analysis details:   (-1.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
                             low trust
                             [64.147.108.71 listed in list.dnswl.org]
  0.0 LOTS_OF_MONEY          Huge... sums of money
 -1.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1oaOFv-0001iJ-MT
Subject: Re: [f2fs-dev] [SPAM] Congratulations you won $640,000!!!!
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

QXdlc29tZSHCoCBOb3cgd2UgY2FuIGFmZm9yZCB0byBkZXZlbG9wIHRoYXQgbmV3IGFkZGl0aXZl
LCBiYWNrZ3JvdW5kCmNvbXByZXNzaW9uIG9wdGltaXphdGlvbiB3aXRoIHRoZSBzaGFyZWQgZGlj
dGlvbmFyeSBvYmplY3RzIQoKT24gOS8xOS8yMiAwOTozOSwgQ2hyaXN0aW5lIFdlaXIgd3JvdGU6
Cj4gTWFrZSB1c2Ugb2YgdGhpcyAkNjQwLDAwMCBkb25hdGlvbiBvZmZlciBmcm9tIG1lIHRvIHlv
dS4gRW1haWwgbWUgZm9yIG1vcmUgZGV0YWlsczoKPgo+IEkgYW50aWNpcGF0ZSB5b3VyIGVhcmxp
ZXN0IHJlc3BvbnNlLgo+IENocmlzdGluZSBXZWlyCj4gQ2hhaXJtYW4gV2VpciBGb3VuZGF0aW9u
L1RydXN0Cj4KPiBSZWdhcmRzCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
