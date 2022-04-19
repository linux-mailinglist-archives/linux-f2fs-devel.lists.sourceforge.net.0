Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B2C50628C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 05:19:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngeOQ-0002tf-S8; Tue, 19 Apr 2022 03:19:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1ngeOQ-0002tZ-2a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 03:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UEL2P2nS0cJcM5KcI+bv5bEAj3HcrbPSGJjI9+iNMuQ=; b=md8lbNZG5LxipQ0F7v2E6VvoeN
 K/Z9wPdqYwZvJ36U9HTGRzOp4Q2d/uNtBsn2F2Cj9RvSYwE5C10amZeE8r1bkjtmdmbdQlDHnD79/
 BCUxOW+5vF2EaiYrg4kB2F0xGwZFYvn8k7oZYQWZH6TBouI+zT4zCLFsgO/JO88pzBBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UEL2P2nS0cJcM5KcI+bv5bEAj3HcrbPSGJjI9+iNMuQ=; b=I9FxhRwBS5Vdu8lVZsn5pr5FVm
 KpppGUqMJt7f5lJ77twkEX4iAkca5W2vBNNUE8Lz/1y0aaxRBrnjqSopvaeCqXvy8V5D43A3QE3jZ
 nHbfUYYbUkvljKxh5AwrUlxFkd4SrJo2hYkJ+U/3tLkmyT9f2NTWPcCmkOHb2GoxIU5o=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngeOO-0004no-DU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 03:19:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 53E04B80A72;
 Tue, 19 Apr 2022 03:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0840C385A7;
 Tue, 19 Apr 2022 03:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650338332;
 bh=n0VqmNp9Q/CWVDkX0UhhbO6xIAM/hOOSr1ptOPIdeoY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T/5WGBYlFp1gL2NKjukwwcRZ+bGenghfSir5xlz/lAF4nZAnqZWutAXfz9wAtVvzi
 DkuZEd0YZvOg3WoSnFIju4ScMq3nDqvNCcmfDMLtxXoDlMB8i9SinvpdQX0Vrzg4qX
 aBPaFwK47os5qhDOckOle3ldkuX35gNUN8FsqAHP0je0LnpCfyCZYOS/pKLo2dySIF
 UjBJRkaTo5RKM3QZEuTQnn6hfX2h0WjPE0JVrZl6cgESLIrhUfHNR4gWPWstl7Y7Js
 fgow71CxnmQCDuNj+cIbs+Y14N8iKvYHdOxP8wUe+ENpFPs7yXQ0xiQjZxo6gDhwjt
 5wz5NjOWC+10Q==
Date: Mon, 18 Apr 2022 20:18:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
Message-ID: <Yl4qGkrfMT7FqbJj@sol.localdomain>
References: <20220418063312.63181-1-changfengnan@vivo.com>
 <20220418063312.63181-2-changfengnan@vivo.com>
 <Yl0RmUoZypbVmayj@sol.localdomain>
 <KL1PR0601MB400369725474F2A2DE647057BBF39@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <Yl3lxMnZ5teL+bkU@sol.localdomain>
 <KL1PR0601MB4003A659B51814320E156C35BBF29@KL1PR0601MB4003.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <KL1PR0601MB4003A659B51814320E156C35BBF29@KL1PR0601MB4003.apcprd06.prod.outlook.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Apr 19, 2022 at 03:14:51AM +0000, 常凤楠 wrote:
    > > Thanks for your explanation, this patchset has too many case to forget
    to handle... > Back to my first thought, maybe there should have o [...] 
 
 Content analysis details:   (-5.8 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngeOO-0004no-DU
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: notify when device not supprt
 inlinecrypt
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>, "tytso@mit.edu" <tytso@mit.edu>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBBcHIgMTksIDIwMjIgYXQgMDM6MTQ6NTFBTSArMDAwMCwg5bi45Yek5qWgIHdyb3Rl
Ogo+IAo+IFRoYW5rcyBmb3IgeW91ciBleHBsYW5hdGlvbiwgdGhpcyBwYXRjaHNldCBoYXMgdG9v
IG1hbnkgY2FzZSB0byBmb3JnZXQgdG8gaGFuZGxlLi4uCj4gQmFjayB0byBteSBmaXJzdCB0aG91
Z2h0LCBtYXliZSB0aGVyZSBzaG91bGQgaGF2ZSBvbmUgc3lzZnMgbm9kZSB0byBpbmRpY2F0ZSB0
aGUgCj4gZGV2aWNlIHN1cHBvcnQgaW5saW5lY3J5cHQgb3Igbm90ID8gU28gdXNlciBjYW4ga25v
dyBpdCdzIGRldmljZSBub3Qgc3VwcG9ydCBpbmxpbmVjcnlwdAo+IGFuZCBub3QgZm9yIG90aGVy
IHJlYXNvbnMuCj4gCgpMaW51eCB2NS4xOCBoYXMgdGhhdC4gIFNlZSBodHRwczovL2dpdC5rZXJu
ZWwub3JnL2xpbnVzLzIwZjAxZjE2MzIwMzY2NjAKKCJibGstY3J5cHRvOiBzaG93IGNyeXB0byBj
YXBhYmlsaXRpZXMgaW4gc3lzZnMiKS4KCi0gRXJpYwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
