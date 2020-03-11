Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B34B3181792
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 13:13:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jC0F8-0000vM-9i; Wed, 11 Mar 2020 12:13:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1jC0F6-0000v9-7Q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 12:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BwPDz3/EZVYiftSUqSD78NCgdx//lN44sl2mJjYygFQ=; b=dvn0gR+x5LReoRfVvIaXA0MC5k
 MgGOanhYA5d9ixf3bB+YG8T0l9aD9UfRDBSuug30MGIQ81PIHyc4FhQzCYOwHXBMoE9DYh/Fwqnjm
 bCl8bqlF2gycePfiScXFNmGipWlczmh4/BPcuQoazDvJPsvHxzMdsMr9gjpnggJJvHWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BwPDz3/EZVYiftSUqSD78NCgdx//lN44sl2mJjYygFQ=; b=SXgwhNK/6jc9d0uud9akF1L+ng
 XA5Le8PXQYwPRmQQUOx0pU4HqX28k4s7asb2Zqn1av3dX/EonmDhvhjP1WJUssWkGc783JuXkRVTU
 AV0SHxBxFkeyWvD1QTQLMCEoZmfgCveuzsSQk7FmwCmxsujszDC0aW5tHkSWbhW0oRCU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jC0F3-004i2Y-7H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 12:13:44 +0000
Received: from [192.168.0.107] (unknown [117.89.210.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63BD8222C3;
 Wed, 11 Mar 2020 12:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583928810;
 bh=vqU+E2PugMiRG0JrVRdEfDMYNB1TASrjqhqiTXw43mQ=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=iSeRMOsh86K1Nvrq0Cf6HWVD5JZRHXQ/dPYsuWiaVpL+yVtQ79gLJBBGSmzw7SglW
 TG3c8qX8dizn/CgaNd1OueAeFp805rrir0Ub356Ydix9Ym6SL+aElrWJVJaVPxTf2Y
 aH0UBTNt1TWS7L2hV6PNyCv9tueKG225OIrup2xY=
To: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>, Chao Yu
 <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20200225120814.gjm4dby24cs22lux@core.my.home>
 <20200225122706.d6pngz62iwyowhym@core.my.home>
 <72d28eba-53b9-b6f4-01a5-45b2352f4285@huawei.com>
 <20200226121143.uag224cqzqossvlv@core.my.home>
 <20200226180557.le2fr66fyuvrqker@core.my.home>
 <7b62f506-f737-9fb2-6e8e-4b1c454f03b2@huawei.com>
 <20200306120203.2p34ezryzxb2jeuk@core.my.home>
 <0ce08d13-ca00-2823-94eb-8274c332a8ef@huawei.com>
 <20200311103309.m52hdut7mt7crt7g@core.my.home>
 <c3d53657-7c2a-9d2f-9111-048db6e30a7e@huawei.com>
 <20200311110150.ajywqttf7pyrpnau@core.my.home>
From: Chao Yu <chao@kernel.org>
Message-ID: <4a4f8d66-67ec-4f85-ab8d-e3dbe856f54a@kernel.org>
Date: Wed, 11 Mar 2020 20:13:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200311110150.ajywqttf7pyrpnau@core.my.home>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 CTE_8BIT_MISMATCH      Header says 7bits but body disagrees
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jC0F3-004i2Y-7H
Subject: Re: [f2fs-dev] Writes stoped working on f2fs after the compression
 support was added
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC0zLTExIDE5OjAxLCBPbmTFmWVqIEppcm1hbiB3cm90ZToKPiBPbiBXZWQsIE1hciAx
MSwgMjAyMCBhdCAwNjo1MToyM1BNICswODAwLCBDaGFvIFl1IHdyb3RlOgo+PiBIaSwKPj4KPj4+
PiBPb3BzLCBpdCBsb29rcyBwcmV2aW91cyBmaXggcGF0Y2gganVzdCBjb3ZlciB0aGUgcm9vdCBj
YXVzZS4uLiA6KAo+Pj4+Cj4+Pj4gRGlkIHRoaXMgaXNzdWUgc3RpbGwgaGFwcGVuIGZyZXF1ZW50
bHk/IElmIGl0IGlzLCB3b3VsZCB5b3UgcGxlYXNlIGFwcGx5IHBhdGNoCj4+Pj4gdGhhdCBwcmlu
dHMgbG9nIGR1cmluZyBkb3duL3VwIHNlbWFwaG9yZS4KPj4+Cj4+PiBOb3QgZnJlcXVlbnRseS4g
SnVzdCBvbmNlLiBJIGNvdWxkbid0IGFmZm9yZCBGUyBjb3JydXB0aW9uIGR1cmluZyB1cGRhdGUs
Cj4+Cj4+IEFscmlnaHQuCj4+Cj4+PiBzbyBJIHJldmVydGVkIHRoZSBjb21wcmVzc2lvbiBzdXBw
b3J0IHNob3J0bHkgYWZ0ZXIuCj4+Cj4+IFdoYXQgSSBjYW4gc2VlIGlzIHRoYXQgZmlsZXN5c3Rl
bSB3YXMganVzdCBzdHVjaywgcmF0aGVyIHRoYW4gaW1hZ2UgYmVjYW1lCj4+IGNvcnJ1cHRlZCwg
SSBndWVzcyB0aGUgY29uZGl0aW9uIGlzIG5vdCBzdWNoIGJhZCwgYW55d2F5LCBpdCdzIG9rYXkg
dG8ganVzdAo+PiByZXZlcnQgY29tcHJlc3Npb24gc3VwcG9ydCBmb3Igbm93IHRvIGtlZXAgZnMg
c3RhYmxlLgo+Cj4gWWVzLCB0byBiZSBwcmVjaXNlLCBmaWxlIHdyaXRlcyB3ZXJlIG5vdCBjb21w
bGV0ZWQgYW5kIGZzIHdhcyBzdHVjay4KPiBUaGUgc3lzdGVtIGFzIGEgd2hvbGUgd291bGQgcHJv
YmFibHkgYmVjb21lIHVuYm9vdGFibGUgaWYgdGhpcyB3b3VsZAo+IGhhcHBlbiB0byBjb3JlIGxp
YnJhcmllcyBuZWNlc3NhcnkgZm9yIHN5c3RlbWQsIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQsCj4g
YnV0IGZpbGVzeXN0ZW0gaXRzZWxmIHdhcyBub3QgY29ycnVwdGVkLgo+Cj4gUmUtd3JpdGluZyB0
aGUgZmlsZXMgd2FzIGVub3VnaCB0byByZWNvdmVyIHRoZSBzeXN0ZW0uCgpTbywgYWN0dWFsbHks
IHdoYXQgeW91IG5lZWRlZCBpcyBhbiBhdG9taWMgdXBkYXRlIG9mIGFsbCBzeXMgcmVsYXRlZCBm
aWxlcywKSSBndWVzcyB5b3UgY291bGQgaGF2ZSBhIHRyeSB3aXRoIGNoZWNrcG9pbnQgZGlzYWJs
aW5nIGZlYXR1cmUgb2YgZjJmcywgd2hpY2gKYWxsb3dzIHRvIHVwZGF0ZSBmaWxlIHN5c3RlbSBk
YXRhIGF0b21pY2FsbHkuCgo+Cj4gSSBndWVzcyB3ZSdsbCBzZWUgaWYgdGhlcmUgd2lsbCBiZSBt
b3JlIHJlcG9ydHMgYWZ0ZXIgNS42IGlzIHJlbGVhc2VkLAo+IG9yIGlmIGl0J3MganVzdCBzb21l
IHF1aXJrIGluIG15IHN5c3RlbS4KCll1cC4KCj4KPiBJJ2xsIHRyeSB0byBjb2xsZWN0IG1vcmUg
aW5mb3JtYXRpb24sIG9uY2UgSSdsbCBoYXZlIHNvbWUgdGltZSwgdG8KPiBnZXQgdG8gdGhlIGJv
dHRvbSBvZiB0aGlzLgoKVGhhbmtzIGluIGFkdmFuY2UuIDopCgpUaGFua3MsCgo+Cj4gdGhhbmsg
eW91IGFuZCByZWdhcmRzLAo+IAlvLgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
