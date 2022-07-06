Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB29B5686AB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Jul 2022 13:23:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o937V-0001nd-8J; Wed, 06 Jul 2022 11:23:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <vincent@systemli.org>) id 1o937U-0001nO-2H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jul 2022 11:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:From
 :To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TOAO7BIiA0lfAS9E5FkdWtBFiMrFIIxXe8WZ6H18TH4=; b=EQATq6GYWEVwu1ASRX7WQ9xJP3
 e4k2Ge1HGkPHw3J9vbMx6g+9kI+8F3f7XjOhhGSWMJy7KuECvt3HA6aBFaLSEmkQ6x1Xg85UzoVZJ
 wI4kUdYCjxcxmhkEKRYFV9w51ptj5w35KrffwBCeUtpIOA5cJ+UiM8O7sDkkbhGKi+NM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:To:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TOAO7BIiA0lfAS9E5FkdWtBFiMrFIIxXe8WZ6H18TH4=; b=d
 kKz01DPP/MQlIIOdSY/wO+G51ymiVpE4trwIyTdjP0/PqIbUjRykMm9oe9foKO/2NWPmsArudF2Aw
 eMP8+gDuuvpsdqflDDvCNbTLEf0THrtH30v1dj+C6/q6kjC7Cnf/WldHJuGePVCyfXbcrRh5JieRl
 0HIXoYmhL/cy3jqs=;
Received: from mail1.systemli.org ([93.190.126.36])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o937P-0003VM-QN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jul 2022 11:22:59 +0000
Message-ID: <44ab9f62-3b4f-428e-0531-8bc87e6d7c05@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1657106562;
 bh=TOAO7BIiA0lfAS9E5FkdWtBFiMrFIIxXe8WZ6H18TH4=;
 h=Date:To:From:Subject:From;
 b=m4OTvrr01a97f8auD9Loe23gUk6iGq18HIi8bEyN4c8Kvrq4O17Ftw3eBCNywRD7b
 rye2vaZnbFrsD/K1wxQ7Xf7sDRevE7JbZFs5dBuI/65kD82A+myiy2K1r3raqEHPa3
 dizyyHpAZnioOOJ+QHj6q811rPw6gcOO8ugmZjIb4xZ9LAe3/4pvgB3QOUvlIxqAIU
 FgOPaFP5BWw0hiahqRq9TIpsEunYrcOVH52Q34QWRfbr1GVW/y52ykpVpTjAjTJiGU
 S21RomiLkV9wPS9TxPfHFFYb84iMaS2/T8S9qgv1RajwN+72z/To5GtTSj1l9GY7zl
 a+wKyDPPj2WwA==
Date: Wed, 6 Jul 2022 13:22:40 +0200
MIME-Version: 1.0
Content-Language: en-US
To: linux-f2fs-devel@lists.sourceforge.net
From: Nick <vincent@systemli.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The configure.ac is broken using OpenWrt. It wrongly detect
 libs that are not present. Both patches [0,1] are now applied to OpenWrt
 Master and work as they should: - https://github.com/openwrt/openwr [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1o937P-0003VM-QN
Subject: [f2fs-dev] OpenWrt fixes for autotools
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The configure.ac is broken using OpenWrt. It wrongly detect libs that 
are not present.
Both patches [0,1] are now applied to OpenWrt Master and work as they 
should:
- 
https://github.com/openwrt/openwrt/commit/a0c5b03e02528b938f1c6d411a582b67b7e9fe7b
- 
https://github.com/openwrt/openwrt/commit/a0c5b03e02528b938f1c6d411a582b67b7e9fe7b

I would appreciate if we could merge those upstream or find another 
solution.

[0] - 
https://lore.kernel.org/linux-f2fs-devel/20220704092919.1420469-1-vincent@systemli.org/
[1] - 
https://lore.kernel.org/linux-f2fs-devel/20220703084837.788372-1-vincent@systemli.org/

Bests
Nick



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
