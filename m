Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB825F295
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Sep 2020 06:51:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Message-Id:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive
	:List-Unsubscribe:List-Id:Subject:Date:To:Content-Description:MIME-Version:
	Sender:Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WT5EWmn5aOk7L72bRDt9ZD0amfxlHx5CVYTqInjtPSg=; b=ZMsqP/uSM4zCrAER761V1GK9Mb
	H2irPjjX+bWxZeI8R9b9+gs99ZRnII5aJfkZdluwtKVKYiInY8MHlWYM/exbDy9Pxv4c7VV2bEtZw
	6ojUFAha07bQRCuZ/ocizl5IotZFTk9c5dyjadreZ9dNgHhU2i6LXOLpgMHzLaYYBaBs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kF987-0004Dp-KD; Mon, 07 Sep 2020 04:51:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <info@unituscapital.com>) id 1kF986-0004DN-5k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Sep 2020 04:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jv0mY1QY5098IZ8naThhABFUPGYlhCFLZcPwBHl+D3k=; b=iLuGhWC2RwCm28quBYV2DSXThy
 dm2o6+0AY6GF76A4HiQGtZ6Kqkc2FdOLrBZ1jYP04/UzQIjSnqPGIslphdMb28hv2QWKqAEBQlblp
 LankZLvvk08Ge3gHP5KOlj913zbT+ocSXWoB4vi++utmpkLa0DuSVCk2rP2IU838ay1A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jv0mY1QY5098IZ8naThhABFUPGYlhCFLZcPwBHl+D3k=; b=IaGIy379CE5jUWKVhZ2pnuOsMx
 AYYYjVWjUxh4u+sw0puwGJ4crlWds5Qm96v8C3P8orPtkM3f34xs/KFwI4N/6vS9XKKtt5bUCSFu+
 OSxrmcSjaBSDl2COoJREWlW12TJkXWgYCJPi8eI+HcFsLp7W7nWgcW3RSIRanyZbvUb0=;
Received: from [165.22.66.44] (helo=mail.seen.ps)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kF983-00FKkH-6y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Sep 2020 04:51:46 +0000
Received: from [192.168.8.10] (ip168-243-231-195.intercom.com.sv
 [168.243.231.195])
 by mail.seen.ps (Postfix) with ESMTPA id 4B6B714D1E4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Sep 2020 07:42:52 +0300 (IDT)
MIME-Version: 1.0
Content-Description: Mail message body
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 06 Sep 2020 22:42:49 -0600
X-Spam-Score: 7.5 (+++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.3 RCVD_IN_RP_RNBL        RBL: Relay in RNBL,
 https://senderscore.org/blacklistlookup/
 [165.22.66.44 listed in bl.score.senderscore.com]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.5 SUBJ_ALL_CAPS          Subject is all capitals
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in digit
 (andrewmacklin12[at]gmail.com)
 1.0 MISSING_MID            Missing Message-Id: header
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 LOTS_OF_MONEY          Huge... sums of money
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1kF983-00FKkH-6y
Subject: [f2fs-dev] GREETINGS TO YOU.
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
From: Angel Investors via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: andrewmacklin12@gmail.com
Cc: Angel Investors <info@unituscapital.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
Message-Id: <E1kF987-0004Dp-KD@sfs-ml-1.v29.lw.sourceforge.com>

QXR0ZW50aW9uIFRvIEVtYWlsIDogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKR29vZCBEYXkgU2lyLApPdXIgR3JvdXAgaGF2ZSB0aGUgZmluYW5jaWFsIGNhcGFiaWxpdHkg
dG8gZmluYW5jZSBhbnkgaW52ZXN0bWVudCBwb3J0Zm9saW8gYXMgZmFyIGFzIGlzIGdlbnVpbmUs
IGFsbCB3ZSBuZWVkIGlzIGEgY2FwYWJsZSBidXNpbmVzcyBwYXJ0bmVyIHRoYXQgcG9zc2Vzc2Vz
IGludmVzdG1lbnQgc3RyYXRlZ2llcyBmb3IgcHJvZml0YWJsZSBidXNpbmVzcyBpbmZvcm1hdGlv
biBmb3IgZ29vZCB0dXJuIG92ZXIgd2l0aGluIDEwLTMweWVhcnMuIE91ciBQYXJ0bmVycyBhcmUg
d2lsbGluZyB0byBpbnZlc3QgMTBtaWxsaW9uIOKAlCA1YmlsbG9uIFVTRC4gV2UgY2FuIHByb3Zp
ZGUgcHJvb2Ygb2YgZnVuZHMgb24gZGVtYW5kLCBhZnRlciBjZXJ0aWZpY2F0aW9uIG9mIHlvdXIg
ZG9jdW1lbnRzL2RldGFpbHMuIFBsZWFzZSB3cml0ZSBtZSBiYWNrIGlmIHlvdSBjYW4gd29yayB3
aXRoIG1lIG9uIHRoaXMgcHJvamVjdC4gVGhhbmsgWW91LApCZXN0IFJlZ2FyZHMKQW5kcmV3IE1h
Y2tsaW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
