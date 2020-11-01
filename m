Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5022A2186
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Nov 2020 21:26:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZJvw-0001PB-1x; Sun, 01 Nov 2020 20:26:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sales2@notary.co.nz>) id 1kZJvv-0001Oj-9g
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Nov 2020 20:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Reply-To:From:Date:Subject:To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ADC6tqr/FZFFgeWuwcG/dpIicyu7rz/ktNl9WQc1tck=; b=iuDHalan5XfsEk9ENPgNhe8NrH
 3y7nvMfyvsOOVTe1f2riC6fht5VCTcNGHap8A5YisVKeA6JEWAAahxXnjsYDVcQZUCZOJmnpo8cWa
 FefOB3G2HH/WdYm0HyGuAe5hlJ/OzJMZlzPdlUcyVKVYSre+TKHpIHZCIWnoskmOHIKA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Reply-To:
 From:Date:Subject:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ADC6tqr/FZFFgeWuwcG/dpIicyu7rz/ktNl9WQc1tck=; b=n
 J0ix4bFvV6lVQs0pmRqb9NCpH7zPOyCVgxnk1RrUgGWU43vgK61iYNNze1GAg9FarYRbF9tWH5OKE
 7uL3gRL+FTk/75rsz7swVXbTcv3hft0F5ohjYpI9Ttc/Z/R+rfrtzC68Bip1zmAalP3IwTFCB6FsZ
 Oj19NlSSmCjIiIXQ=;
Received: from nz.wekaonline.co.nz ([49.50.243.18])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZJvq-005X3X-E5
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Nov 2020 20:26:35 +0000
Received: from notarypublicco by nz.wekaonline.co.nz with local (Exim 4.93)
 (envelope-from <sales2@notary.co.nz>) id 1kZK0G-00051D-VX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 09:31:05 +1300
To: linux-f2fs-devel@lists.sourceforge.net
X-PHP-Script: notary.co.nz/sav.php for 110.169.12.234
X-PHP-Originating-Script: 1048:sav.php
Date: Sun, 1 Nov 2020 20:31:04 +0000
From: Chris Mohr <sales2@notary.co.nz>
Message-ID: <8398ba61545ffa42f656ada85753ccd0@notary.co.nz>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - nz.wekaonline.co.nz
X-AntiAbuse: Original Domain - lists.sourceforge.net
X-AntiAbuse: Originator/Caller UID/GID - [1048 993] / [47 12]
X-AntiAbuse: Sender Address Domain - notary.co.nz
X-Get-Message-Sender-Via: nz.wekaonline.co.nz: authenticated_id:
 notarypublicco/from_h
X-Authenticated-Sender: nz.wekaonline.co.nz: sales2@notary.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: notarypublic.co.nz:/public_html
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: deltrolcrop.com]
 1.5 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [49.50.243.18 listed in psbl.surriel.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.3 RCVD_IN_RP_RNBL        RBL: Relay in RNBL,
 https://senderscore.org/blacklistlookup/
 [49.50.243.18 listed in bl.score.senderscore.com]
X-Headers-End: 1kZJvq-005X3X-E5
Subject: [f2fs-dev] For my order Inquiry.,
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
Reply-To: sales@deltrolcrop.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8gRGVhcixsaW51eC1mMmZzLWRldmVsCgpXZSBhcmUgSW50ZXJlc3RlZMKgaW4gc29tZSBv
ZiB5b3VyIHByb2R1Y3QsIHRoaXMgaXMgbXkgc2Vjb25kIG1haWwgdG8gdGhpcyB5b3VyIGVtYWls
IGFkZHJlc3MKS2luZGx5IHNlbmQgdXMgwqB5b3VyIGNvbXBhbnkgbGF0ZXN0IGNhdGFsb2cgYW5k
IHlvdXIgYmVzdCBwcmljZSBsaXN0LgpBbHNvIGNvbmZpcm0gdGhlIHRlYW1zLgpJIGF3YWl0IHlv
dXIgZmVlZGJhY2sKClRoYW5rcyAmIEJlc3QgwqBSZWdhcmRz4oCmCgpNci4gQ2hyaXMgTW9ocgoK
QSBEaXZpc2lvbiBvZsKgRGVsdHJvbCBDb3JwLgoyNzQwIFNvdXRoIDIwdGggU3RyZWV0IMK3Ck1p
bHdhdWtlZSwgV0kgNTMyMTUgVVNBClBob25lOiA0MTQuNjcxLjY4MDAKRW1haWw6wqBzYWxlc0Bk
ZWx0cm9sY3JvcC5jb20KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
