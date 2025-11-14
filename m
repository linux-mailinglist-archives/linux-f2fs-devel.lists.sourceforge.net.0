Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F5C5B413
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Nov 2025 04:57:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1b9Hv4UeYZHl+PJPj574O1VVAjj02PpnqQ40+JJu6co=; b=a5Ksog4/mj53noeBIiYxNT0OKI
	HZyfm4uC7CjG0GVFoJEH+qf27WoatveOwyA8CfvG+cmjD0s8Oghw5b2WMRa/pnDA+qJfnmH3rltWT
	Gb7Mv/vymQr2qjwPlAmFy/Zpf/nu/hQcOarntXKSfVcReGPhg88YIWmNu/iRvkuOKaJM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vJkwG-0000Hs-0P;
	Fri, 14 Nov 2025 03:57:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vJkwE-0000Hm-Ch
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Nov 2025 03:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9aUU77OcGR4yqwUeBrEUtHPEdcjBK0UatbfVsm6OHQQ=; b=aQ24zpSYdGSzVWoAzCG2Q6XeJe
 Fd9wDMAWvgqWVnXu+I0H0vz1fWypHBXhtZJCNyjI/FpLp4p0dPwOfUrmu5bcgxgUG0j9i29Sl7wUY
 EGeRAnAiKFpW/gGuZZBksjzJFAAE4xO4i1rnEbsfC9alFEgqNe3o8FnIrQMBZmJY5wkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9aUU77OcGR4yqwUeBrEUtHPEdcjBK0UatbfVsm6OHQQ=; b=KjT/3mM0wUZbRWS/Ucgd9ur2Se
 kXU+rk4Dy3tmSgD5updfscWPK8NWMj+mR8Si/ICj9zfLiDVQGAWpg2GV0JtCzw81vig3qRynDzWSR
 CjSeCx8wyCuJJ9lgDBY4n7PU8wE5vHDcQXT8G/3wWe108TDMtRrsNrFNB7zzOo2/s9VY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vJkwE-0007Hd-08 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Nov 2025 03:57:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 35FC96015E;
 Fri, 14 Nov 2025 01:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9004AC4CEF5;
 Fri, 14 Nov 2025 01:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763083843;
 bh=a1cdXiNw2H1JE/HA6Rad4k0t2mwYcH0+AZQJU2v9Q+4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=a6FdrW0O3G2gTk2LmZmezLEusB3LRDO9X6ERx4+XQxYwruG/1CJ+Ghszf8FZdNAcG
 WenInxKs7Mtfd+G7e1fFLFNV3GksMlZ7j0uU6RCd3oNMmvc5NmMZvTzTQJYGNTgvzS
 8zMHYkq8tWw+gWZ25FMVE4/gqV2DYBdaagdoqRUJ5cvVzui23vlp6EQuPDr8EnCyvY
 0lLWyRbb6OFDMMx1iK7QuLQq6B/Ra+ViZhegTw9a5pepT//JcNv2B1+XGe2wuuTV0D
 LkSJ4smZqbE+REoQOhB+d5/ka5f92zu25pjh2hhbiX7EGwETxo6m4u6yyPgOfFkVIy
 MBJ7O5Glyx1qg==
Message-ID: <41d4bf9e-708f-4a24-b9cc-f0adf30140c8@kernel.org>
Date: Fri, 14 Nov 2025 09:30:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joanne Chang <joannechien@google.com>, Zorro Lang <zlang@kernel.org>,
 fstests@vger.kernel.org
References: <20251112135223.3467852-1-joannechien@google.com>
Content-Language: en-US
In-Reply-To: <20251112135223.3467852-1-joannechien@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/12/2025 9:52 PM, Joanne Chang wrote: > Currently,
 residual
 options can interfere with checking the mount > behavior of the listed
 MKFS_OPTIONS
 and MOUNT_OPTIONS. For example, > "Option#120: test [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vJkwE-0007Hd-08
Subject: Re: [f2fs-dev] [PATCH v1 1/3] f2fs/015: clear MKFS_OPTIONS and
 MOUNT_OPTIONS
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTEvMTIvMjAyNSA5OjUyIFBNLCBKb2FubmUgQ2hhbmcgd3JvdGU6Cj4gQ3VycmVudGx5LCBy
ZXNpZHVhbCBvcHRpb25zIGNhbiBpbnRlcmZlcmUgd2l0aCBjaGVja2luZyB0aGUgbW91bnQKPiBi
ZWhhdmlvciBvZiB0aGUgbGlzdGVkIE1LRlNfT1BUSU9OUyBhbmQgTU9VTlRfT1BUSU9OUy4gRm9y
IGV4YW1wbGUsCj4gIk9wdGlvbiMxMjA6IHRlc3RfZHVtbXlfZW5jcnlwdGlvbiIgc2hvdWxkIGZh
aWwgd2l0aCB0aGUgbGlzdGVkCj4gb3B0aW9ucyBidXQgc3VjY2VlZHMgaWYg4oCcTUtGU19PUFRJ
T05TPWVuY3J5cHTigJ0gaXMgcHJlc2V0LiBCeQo+IGV4cGxpY2l0bHkgY2xlYXJpbmcgTUtGU19P
UFRJT05TIGFuZCBNT1VOVF9PUFRJT05TLCB0aGUgdGVzdOKAmXMKPiByZWxpYWJpbGl0eSBjYW4g
YmUgaW1wcm92ZWQuCj4gCj4gZjJmcy8wMTUub3V0IGlzIGFsc28gdXBkYXRlZCB0byBleHBlY3Qg
ZmFpbHVyZSBmb3IgY2FzZXMgdGhhdCByZXF1aXJlCj4gYWRkaXRpb25hbCBta2ZzIGF0dHJpYnV0
ZXMgdG8gbW91bnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9hbm5lIENoYW5nIDxqb2FubmVjaGll
bkBnb29nbGUuY29tPgoKUmV2aWV3ZWQtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KClRo
YW5rcywKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
