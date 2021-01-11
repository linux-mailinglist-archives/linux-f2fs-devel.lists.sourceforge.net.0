Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BECC12F1618
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 14:49:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyxYx-00019Q-FE; Mon, 11 Jan 2021 13:48:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1kyxYt-00019E-TC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 13:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:Reply-To:From:Date:Sender:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xw/HisupCoc6KT9u5qI1+0kpxZF4OlHo1CcnzjK8Hes=; b=gukhAeyUzEJi4VE8ViGXeWQrDA
 PPTeK1oO2jEWdVcQkuNwd+yNDd4E9fSuh5N2bsgkkt+cSNQwn9NxJku0OdUmIT4WeDvK/AyxuPDc1
 Mtu7avbu3W7X9QwM87teZ3FGdDKzMH7BsRFYu7sN5zlS0BJN77dMFA5AhCiwKWRI2JKk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:Reply-To:From:Date:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xw/HisupCoc6KT9u5qI1+0kpxZF4OlHo1CcnzjK8Hes=; b=Z3Y+OL4r2U06mZZDGzz+OUY8+g
 u2yc4Am1cWRON3zrKFtJR9vibXL0kLsS/RfVJu+dmkf0tM1cL/bBlDXO7T56DYsCqQznwdk60tGqT
 Y9p5acVIVK4DvJ0w7zs6qDuwIh0VqvESipCzUaA4honh4csUV5tQaKJytLn2lG2b196Y=;
Received: from [163.53.93.251] (helo=sender2-pp-o92.zoho.com.cn)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyxYW-009NOu-T7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 13:48:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1610372854; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=TKQ3aVMJOgTwQXyUuoysDTF4sRI8H3f2nA+hLaQQZEA3blzX3YdOFWAQiXqvRuclLc9RZK9czZa8u4W9WNk+AH0BICbF4fHD+1btlan3RLBnYrNf4JmD5TKNOJOJYWwNGd4B4NY5S1GbvXkbrt98tIF2QF1IsNxXaBwzefB3PG0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1610372854;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To;
 bh=Xw/HisupCoc6KT9u5qI1+0kpxZF4OlHo1CcnzjK8Hes=; 
 b=YOn0LZAvYdrtmmluvDI4PPmnAVnDB3P/HpNdiWoTopIRyJSZ3RgoVNLwzt0VjPcCTSKgS67UIp+Dd22AAZmix9bQycJC3PNAYnqzg5wr8KYA1ZdyYsx5tk4rM8Z3v1MDX61p1vhI5d5fRBGQ+mVUYJVdbQv0uO5VegdgIDT09/0=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1610372854; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=Date:From:Reply-To:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=Xw/HisupCoc6KT9u5qI1+0kpxZF4OlHo1CcnzjK8Hes=;
 b=YW5NveZ3e9bvRytdSDA2Pstc/LQPeAqz08BhDyCZ5HzwtH2eMUVIpjNA6OF0Aa4x
 esMNo0t0ksYv81JVAeXcU2+783dSwoQLYkrSWo+8V8H/qzLiVIy7iiJHUaCRu/gQ+Rk
 x4wGibCFwNzWvGJ6i3D0iR0gWwZWp7GVIflwb8KQ=
Received: from mail.baihui.com by mx.zoho.com.cn
 with SMTP id 1610372851185713.8995608830727;
 Mon, 11 Jan 2021 21:47:31 +0800 (CST)
Date: Mon, 11 Jan 2021 21:47:31 +0800
From: Chengguang Xu <cgxu519@mykernel.net>
To: "Chao Yu" <yuchao0@huawei.com>
Message-ID: <176f1b3a5ee.deaba0f757366.7662150588541968972@mykernel.net>
In-Reply-To: <cbdc0859-929b-3e8c-a5ed-4f458f6c4bcc@huawei.com>
References: <1610279329-5733-1-git-send-email-cgxu519@mykernel.net>
 <cbdc0859-929b-3e8c-a5ed-4f458f6c4bcc@huawei.com>
MIME-Version: 1.0
Importance: Medium
User-Agent: ZohoCN Mail
X-Mailer: ZohoCN Mail
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1kyxYW-009NOu-T7
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: using generic_file_llseek()
 instead of generic_file_llseek_size()
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
Reply-To: cgxu519@mykernel.net
Cc: jaegeuk <jaegeuk@kernel.org>,
 linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

IC0tLS0g5ZyoIOaYn+acn+S4gCwgMjAyMS0wMS0xMSAxNTozNTowNyBDaGFvIFl1IDx5dWNoYW8w
QGh1YXdlaS5jb20+IOaSsOWGmSAtLS0tCiA+IE9uIDIwMjEvMS8xMCAxOTo0OCwgQ2hlbmdndWFu
ZyBYdSB3cm90ZToKID4gPiBnZW5lcmljX2ZpbGVfbGxzZWVrX3NpemUoKSBpcyB1c2VkIGZvciBm
aWxlc3lzdGVtcyB0aGF0IGhhdmUKID4gPiBhIGN1c3RvbSBtYXhpbXVtIHNpemUgYW5kIGEgY3Vz
dG9tIEVPRiBwb3NpdGlvbi4gc28gaXQncyBiZXR0ZXIKID4gPiB0byByZXBsYWNlIGl0IHVzaW5n
IGdlbmVyaWNfZmlsZV9sbHNlZWsoKS4KID4gCiA+IEYyRlMgaW5vZGUgbWF5IGhhdmUgZGlmZmVy
ZW50IG1heCBzaXplLCBlLmcuIGNvbXByZXNzZWQgZmlsZSBoYXZlCiA+IGxlc3MgYmxrYWRkciBl
bnRyaWVzIGluIGFsbCBpdHMgZGlyZWN0LW5vZGUgYmxvY2tzLCByZXN1bHQgaW4gYmVpbmcKID4g
d2l0aCBsZXNzIG1heCBmaWxlc2l6ZS4KID4gCiA+IEkgZ3Vlc3Mgd2Ugc2hvdWxkIGNvbnNpZGVy
IHRoYXQgd2hlbiBjaGVja2luZyBib3VuZGFyeSB3aXRoIHNfbWF4Ynl0ZXMsCiA+IHNvIGhvdyBh
Ym91dCB1c2luZyBiZWxvdyBwYXRjaCBpbnN0ZWFkOgogPiAKID4gU3ViamVjdDogW1BBVENIXSBm
MmZzOiBmaXggdG8gdXNlIHBlci1pbm9kZSBtYXhieXRlcwoKSGkgQ2hhbywKClRoYW5rcyBmb3Ig
eW91ciByZXZpZXcgYW5kIHN1Z2dlc3Rpb24uIEl0IGxvb2tzIGEgcHJvcGVyIGZpeC4KV291bGQg
eW91IG1pbmQgbWUgc2VuZGluZyByZXZpc2VkIHBhdGNoIGZvbGxvdyB5b3VyIHN1Z2dlc3Rpb24/
CgpUaGFua3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
