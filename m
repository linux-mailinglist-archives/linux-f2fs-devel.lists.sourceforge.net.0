Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D378FB1C1D6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Aug 2025 10:10:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:To:Date:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2HtFPD7yHLHuVXI8uPHshCL72Vka/8305l2r/eZeIQ4=; b=W1Qq+nPH/JLlfPfixpMvebnwd7
	p8hj/JdroYQrusWuNgMrEAllLRLQ1nXkW9w45VBEhwmBtsgyWTnS+e/AHfePXmvY/+q9pYhi1kGaS
	tlF0g057YRdAWB9L4BDaTtvojASYosbnge4aa9pkyr8L00zskeauyhwMbqem2LkqXwhA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujZDc-0001pN-NI;
	Wed, 06 Aug 2025 08:09:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dominik.lotka@fintara.pl>) id 1ujZDa-0001p4-7v
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 08:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=; b=Os4ZPekkNrc0h+cfRF7ETzk7FT
 +co/jx4eJ3nAldorzfoMRehm7C0jqq6QDrBVhQoUGPr+BDCqc2en4UCQlcejc4qAWRB1l/p0b1h3Y
 xzmJ8VThMJayK5YyMfe7l2/JLXnYjiFORH4hZYhZMV3n7JyPBH/AXTnzXWj7ikPTGiz0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=; b=K
 KOcUxcNMPykpbcJMeAzvpXEjcbrLgB6Zz4jlFcp1LEtYWxjyPMlzyaUnUg/45Iac0bSwCjNPB/h+E
 JTS54I+MDtRx7YyZuCcFL+Kr+otugiujHZYsn1jxSUQKKozzxADvKKz3Z2yL1OC5nQm10UK2B7yXM
 BqHYRxrArI4m8EUQ=;
Received: from mail.fintara.pl ([51.68.214.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujZDa-0007yc-J2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 08:09:50 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
 id 03E394D7C8; Wed,  6 Aug 2025 10:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
 t=1754467709; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
 h=Date:From:To:Subject:From;
 b=MbaeGaQlS+qhru80Q6vu+4xXnrncp2ayKN7DKegNIMDjcUm6sMs7vERT2PnMhNWks
 m6zkwYEaEeajc7Kq5WWxar0EUf2VKInNlbG4lG4yP1obUgtCIdcYy6ni6uMq+ahW3b
 FEcUuSKwBx20GvcXCV0qLebrBxDQvp+bQKj7+Ve1EkIq2rMg3yDkwfjpLxjnVeZtOc
 8l6ZN5iIz7eVmJYFjQjJIenrkYFXQtfoQP5z4erFozLfgDJIPmDkzETCUZUtDyUCGH
 optqaNqaWCT7Ea0see6VkzjR7BKub7i0G5CoxuvTn7BTH4+ZCosNW1WeJN7n5/2SDx
 tj0qll1oGkc6Q==
Received: by mail.fintara.pl for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  6 Aug 2025 08:06:25 GMT
Message-ID: <20250806084500-0.1.b4.33aru.0.wrumvvcha8@fintara.pl>
Date: Wed,  6 Aug 2025 08:06:25 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dzień dobry, Czy jest możliwość nawiązania współpracy
    z Państwem? Z chęcią porozmawiam z osobą zajmującą się działaniami
    związanymi ze sprzedażą. 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
X-Headers-End: 1ujZDa-0007yc-J2
Subject: [f2fs-dev] =?utf-8?q?Prosz=C4=99_o_kontakt?=
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
From: Dominik Lotka via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dominik Lotka <dominik.lotka@fintara.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpEb21pbmlrIExvdGthCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
