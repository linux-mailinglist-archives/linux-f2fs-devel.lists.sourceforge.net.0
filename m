Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 811E1AECACB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jun 2025 01:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gdwOzj5VEaWQTmhnTdb27lUxQZ2h0DsdQvQmpZi6vPQ=; b=gJ+mWgchhbelrXltv1Jv9PmBQ1
	HRW0fD80LiRZtSPjaWUbLxesWjWtaXBOHEE89BAU93N0sU+JQin7SOpbbjXsF/2zsqOqjHh7NUosR
	ascYPHIcZuop1SBz5jCINeAi4pZl+gL4Je/dPoJ7x9pVGZ/3r0yC87Eu61rP9bo2xtzI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uVfNz-0007OA-Jw;
	Sat, 28 Jun 2025 23:55:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <info54@interactivemetronone.com>) id 1uVfNy-0007O2-7S
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jun 2025 23:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oybMTPdcoA0jAEx7nkNVtKmUJP43sYgSxQgqf7tkT6E=; b=nJVWGsgD8Bwx5kWDn3jHHLbbCv
 AvhKFKfJwLy1dIxKSpUZvRdh8v/klTBO8AyIvnnaXogwmT/mqqFPNDIbBfU5/GmXNUEIeM+eHQVB3
 YurdcCVov89UST9yuaINiSg8jtFoBQtz4ombhu5OKOBRNVq2ydqekhdHqFCj4AsIseN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oybMTPdcoA0jAEx7nkNVtKmUJP43sYgSxQgqf7tkT6E=; b=B
 1zujt6OyocQbFiYivSodz/H/i2ixy3KYPrS0RujKR0BavYfwzyKoyB/XNuyldYkELEHcD17FKtGon
 VPax7jbjJC7+apunoSXFAus5qqJi8e1o+Cn4gaUQpjQ+0sdHftJodfcHoUI0H3lM2mSgyhHsNUhCx
 n9ykk9haNFGBj9uM=;
Received: from mta0.interactivemetronone.com ([79.141.167.156])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uVfNx-0005lq-SI for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jun 2025 23:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default;
 d=interactivemetronone.com; 
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=info54@interactivemetronone.com;
 bh=oybMTPdcoA0jAEx7nkNVtKmUJP43sYgSxQgqf7tkT6E=;
 b=VdBXAxV+Y5XKf8LC+ZDp5C5shkWUfEbrasqSZiTU7h+wmsz9pQ04Lai3KTn4cjEaDtbTJPN6fqt0
 G2ovyuO4659HyXQJX8MPFFI5fOaBO+4KiATMwJ0tqtorCS2UY0QQkZyfqSX9y2snTj/bY0YrNfb6
 HkN3GSo9jm4lurpjnwQ=
To: linux-f2fs-devel@lists.sourceforge.net
Date: 28 Jun 2025 16:54:54 -0700
Message-ID: <20250628165454.22EE947D3AB53195@interactivemetronone.com>
MIME-Version: 1.0
X-Spam-Score: 2.6 (++)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dear linux-f2fs-devel@lists.sourceforge.net, I hope you're
    doing well. This is a courteous reminder regarding Purchase Order #[PO-2025-
    0421], which was sent on 13th of June 2025. We’re following up to confirm
    receipt and inquire about the current status. 
 
 Content analysis details:   (2.6 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in digit
                             [saragraver005(at)gmail.com]
  2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1uVfNx-0005lq-SI
Subject: [f2fs-dev] =?utf-8?q?Friendly_Reminder_=E2=80=93_Purchase_Order_?=
 =?utf-8?b?I1tQTy0yMDI1LTA0MjFd?=
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
From: "Kathlene A. Ryan via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: saragraver005@gmail.com
Cc: "Kathlene A. Ryan" <info54@interactivemetronone.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RGVhciBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCwKCkkgaG9wZSB5b3Un
cmUgZG9pbmcgd2VsbC4KClRoaXMgaXMgYSBjb3VydGVvdXMgcmVtaW5kZXIgcmVnYXJkaW5nIFB1
cmNoYXNlIE9yZGVyICNbUE8tMjAyNS0KMDQyMV0sIHdoaWNoIHdhcyBzZW50IG9uIDEzdGggb2Yg
SnVuZSAyMDI1LiBXZeKAmXJlIGZvbGxvd2luZyB1cCB0byAKY29uZmlybSByZWNlaXB0IGFuZCBp
bnF1aXJlIGFib3V0IHRoZSBjdXJyZW50IHN0YXR1cy4KCktpbmRseSBjb25maXJtIGlmIGV2ZXJ5
dGhpbmcgaXMgb24gdHJhY2sgZm9yIHByb2Nlc3NpbmcgYW5kIApzaGlwbWVudCBhcyBwZXIgdGhl
IGFncmVlZCB0aW1lbGluZS4gSWYgeW91IHJlcXVpcmUgYW55IAphZGRpdGlvbmFsIGluZm9ybWF0
aW9uIG9yIGRvY3VtZW50cywgcGxlYXNlIGRvbuKAmXQgaGVzaXRhdGUgdG8gbGV0IAp1cyBrbm93
LgoKVGhhbmsgeW91IGZvciB5b3VyIGF0dGVudGlvbiwgYW5kIHdlIGxvb2sgZm9yd2FyZCB0byB5
b3VyIApjb25maXJtYXRpb24uCgpCZXN0IHJlZ2FyZHMsCkthdGhsZW5lIEEuIFJ5YW4KUHJvY3Vy
ZW1lbnQgT2ZmaWNlcgpUUkMgQ29tcGFuaWVzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
