Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C417FB01572
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jul 2025 10:06:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:To:Date:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2HtFPD7yHLHuVXI8uPHshCL72Vka/8305l2r/eZeIQ4=; b=Jm/7lgdr/NtASDW7+nWb3cQ73O
	pW+AhVcQiNiOcusY4figUnaGSRm+100pxpmjKBV5Xj7VKEXLpwzNpH85ZWfRUWkTZHUzQsVALFnEx
	o+3T3zxn5i8gIoQvFwbcQpNv1scIGgYjsRlaqe3opikiLtRPhPV8ByRjIQJ9HoP5E4Js=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ua8m9-0003HN-8w;
	Fri, 11 Jul 2025 08:06:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dominik.lotka@fintara.pl>) id 1ua8m6-0003HE-Rp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 08:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=; b=LBPsTNbgf052T81hR80dNbjv/4
 1wljG6SpDCqH0LVMbtEBGLV27qWYmUTbLJC63WqzjO35Hja/YWsItQhLxOtBWNbbv0c4s+5QSoZBg
 UVPW9N55EXFaUn6xxv6tHcurNQJAN49S0mrK9SiBsHy1vJwzLnQz+a0q6OK0CoKaO07s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=; b=M
 pJL70Q74AU61jZrEzqfNg84w/ybCOv+5Eutp/rMifR7dugIDZF8oDCH5w4FsUyggHVA8z2isKLBl/
 lwfxLFS8Y0Gh/BygTenh14epRoH4wW7cloRpFfPPHSVGTh7lS6bVAMt0wQijQMhqFiWH7Pb+UFKZL
 9HF5lLVKxUFL4v5k=;
Received: from mail.fintara.pl ([51.68.214.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ua8m6-0003ma-5c for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 08:06:30 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
 id BF0984D951; Fri, 11 Jul 2025 10:05:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
 t=1752221178; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
 h=Date:From:To:Subject:From;
 b=dmV0mEIjZiFG4cZNEJ8LZvOezSszMceKhi+Kn6d1+ces19R+fdcnz3t6fgiw9A2OK
 JHekix7ME9rzBkguBTZcHKI1ReuNQHw9dIGoBJxCrabqciX8tMuDYyWBoOJ+ATZMcf
 u2RyGcweBwHmjbbsKpZhd/PlwmVpU5207XgkYx7afTipRmnSzm0njs3LrwHp5yLK2g
 6kYDrBNSNZ8wBdivn+LYur5kS8+xdmyhN8a+mGMI1Gd39iZBxUBaij7I9SxMrDdoQo
 uRxLbQb+d3xBN9blBbKdH4omZCz9GbgOAHlGuWmXvRmygxqnTXb8gXPLIdXewm6ZVp
 5y8YVq5yNBIqw==
Received: by mail.fintara.pl for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Jul 2025 08:05:10 GMT
Message-ID: <20250711084501-0.1.am.2t53u.0.a9tey2zh7e@fintara.pl>
Date: Fri, 11 Jul 2025 08:05:10 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1ua8m6-0003ma-5c
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
