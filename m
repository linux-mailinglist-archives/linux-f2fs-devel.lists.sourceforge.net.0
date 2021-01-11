Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB002F186A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 15:38:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyyLG-0002WN-0K; Mon, 11 Jan 2021 14:38:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kyyLE-0002W9-TT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MEn5D2H1DvseGnHco2QmUfP8UjBCu5RqQQV0I8FZO5s=; b=eM0dkDExqKG9nyyQBPZABIi5gp
 iaDm+mK5v18Q2HgSFa0TeHJkfn0Z3JSfmwT8YDvm+IUsvzSpygWPC0l1CFO31BRBm4EutgkZbUvdc
 zCtZ8Ojy6N9sp2k/bEV1o5BS8qawF6OaMNrneZgD2y62ouNrxJJ6qwC0trAtWv3Y1T6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MEn5D2H1DvseGnHco2QmUfP8UjBCu5RqQQV0I8FZO5s=; b=MatNA00WFCKPjwVILCWFnDZkY3
 AUx1jcMsHRQXvd+CY519yU5LesxNh6QEVP+8Pi2P45SGdjDlgwCMyfZxc18yVF901oCpi8ngTt0g/
 5mVUOiySfUwkTNIYdGyw/DAZ+M4hV200bsYGS+QEjMOcR9cqRVa1rH7NNJTOS9rWkTT8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyyL4-009Xf3-1M
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:38:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0B8721744;
 Mon, 11 Jan 2021 14:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610375901;
 bh=u29FyUdZFH58g/whPLDIPxaQeAlRSOYjc55k0QhxjUw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gQZ29FWGO8BTW6PmW+kiI9GrVMEyTk2Ud25cJSzojV1bMjQRy1hC2ByXYSjMrPIBc
 sqLaAaHpVQd8OWPGC/JueO3bCA0G1v8cWfPOUSG28jfeFzBg/IquMNFKA+q9Ol/Mxi
 MBh07J2nbXRBXRo9tYkRMtWyA3nKHnPyq98fs/K0neC8SWMqa/xOWLWp+9LQVzEd+X
 equDLVnEk3Fs6PGuuG9iEAojFJshb/L/rezLulief77ikOagbdeALcYeE/FhhjbIAS
 B9JsBhA3vzlmaJcg0PsqXebIRvxFkDUB2vCo7l0KkOoLDmTvGwq0OP67oTnXAeH/Wo
 YDjvNPXn/RNag==
To: cgxu519@mykernel.net, Chao Yu <yuchao0@huawei.com>
References: <1610279329-5733-1-git-send-email-cgxu519@mykernel.net>
 <cbdc0859-929b-3e8c-a5ed-4f458f6c4bcc@huawei.com>
 <176f1b3a5ee.deaba0f757366.7662150588541968972@mykernel.net>
From: Chao Yu <chao@kernel.org>
Message-ID: <6f0624b3-1f22-1599-1833-eef118ae24eb@kernel.org>
Date: Mon, 11 Jan 2021 22:38:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <176f1b3a5ee.deaba0f757366.7662150588541968972@mykernel.net>
Content-Language: en-US
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kyyL4-009Xf3-1M
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
Cc: jaegeuk <jaegeuk@kernel.org>,
 linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8xLzExIDIxOjQ3LCBDaGVuZ2d1YW5nIFh1IHdyb3RlOgo+ICAgLS0tLSDlnKgg5pif
5pyf5LiALCAyMDIxLTAxLTExIDE1OjM1OjA3IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4g
5pKw5YaZIC0tLS0KPiAgID4gT24gMjAyMS8xLzEwIDE5OjQ4LCBDaGVuZ2d1YW5nIFh1IHdyb3Rl
Ogo+ICAgPiA+IGdlbmVyaWNfZmlsZV9sbHNlZWtfc2l6ZSgpIGlzIHVzZWQgZm9yIGZpbGVzeXN0
ZW1zIHRoYXQgaGF2ZQo+ICAgPiA+IGEgY3VzdG9tIG1heGltdW0gc2l6ZSBhbmQgYSBjdXN0b20g
RU9GIHBvc2l0aW9uLiBzbyBpdCdzIGJldHRlcgo+ICAgPiA+IHRvIHJlcGxhY2UgaXQgdXNpbmcg
Z2VuZXJpY19maWxlX2xsc2VlaygpLgo+ICAgPgo+ICAgPiBGMkZTIGlub2RlIG1heSBoYXZlIGRp
ZmZlcmVudCBtYXggc2l6ZSwgZS5nLiBjb21wcmVzc2VkIGZpbGUgaGF2ZQo+ICAgPiBsZXNzIGJs
a2FkZHIgZW50cmllcyBpbiBhbGwgaXRzIGRpcmVjdC1ub2RlIGJsb2NrcywgcmVzdWx0IGluIGJl
aW5nCj4gICA+IHdpdGggbGVzcyBtYXggZmlsZXNpemUuCj4gICA+Cj4gICA+IEkgZ3Vlc3Mgd2Ug
c2hvdWxkIGNvbnNpZGVyIHRoYXQgd2hlbiBjaGVja2luZyBib3VuZGFyeSB3aXRoIHNfbWF4Ynl0
ZXMsCj4gICA+IHNvIGhvdyBhYm91dCB1c2luZyBiZWxvdyBwYXRjaCBpbnN0ZWFkOgo+ICAgPgo+
ICAgPiBTdWJqZWN0OiBbUEFUQ0hdIGYyZnM6IGZpeCB0byB1c2UgcGVyLWlub2RlIG1heGJ5dGVz
Cj4gCj4gSGkgQ2hhbywKPiAKPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGFuZCBzdWdnZXN0aW9u
LiBJdCBsb29rcyBhIHByb3BlciBmaXguCj4gV291bGQgeW91IG1pbmQgbWUgc2VuZGluZyByZXZp
c2VkIHBhdGNoIGZvbGxvdyB5b3VyIHN1Z2dlc3Rpb24/CgpIaSBDaGVuZ2d1YW5nLAoKSXQncyBm
aW5lIHRvIG1lLgoKVGhhbmtzLAoKPiAKPiBUaGFua3MKPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
