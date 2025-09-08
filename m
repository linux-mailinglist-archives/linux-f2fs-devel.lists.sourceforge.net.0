Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 371F5B48594
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Sep 2025 09:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:To:Date:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/fvGw+HukmNa+zishKEIMQQHBesd3rQT4sKL+Qgx/uw=; b=NIxdirPGW2J0iopj3pO2LW7Wq6
	dGOyK/ckS/McZXTo4atB/vNIyHepH3GEXP9TZYVUBwXPDhBlDM8J1QMjpMbwjYM1m0Rqi/unVyQ58
	GnNNtuevxZYcMWQxWXLoEGK8H4J6inuuJSn3Dfrm5ffTJvhcwoIElW26OmkWM0vlm2/Q=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uvWSZ-0002Uh-3g;
	Mon, 08 Sep 2025 07:38:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <adrian.liszka@proventix.pl>) id 1uvWSX-0002Ub-Lq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Sep 2025 07:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=kNqu/h+djx9ka8KgrbDk9q2+Bg
 hdr6QvPlmpWMR8gSuSTg4OEIGaWUA9L1cCQ7aGZBqwST4vEpAVgX04elZpbJEtxgImiCC3KBPe6vU
 Im08c6pTbEGK7pvVfO2BSg0B8KrYedDn16mlYLCCEA7k4b+zs98dLniw/xsWbWwwfKEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=d
 NAaeYE/e9ZZ+fFXkAonRt6aKi7PbHHltRCwjASld8d4d2j1/sAlyc/dqKq0uzMVPY1UWD3lrZWj1Y
 dPj5OKVlD0+ISnzwMjfA7FnI17QjzUOQPbZREOjRxM7zSdnlFNui02t0bnq9iAIYN+459ckf/FSnr
 rjukJMzCJdDB/YJg=;
Received: from mail.proventix.pl ([51.195.118.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uvWSX-0002YQ-2b for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Sep 2025 07:38:41 +0000
Received: by mail.proventix.pl (Postfix, from userid 1002)
 id 0DF3DA4166; Mon,  8 Sep 2025 09:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=proventix.pl; s=mail;
 t=1757317109; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
 h=Date:From:To:Subject:From;
 b=i6Bz3NBqqZ35gRa015MWA8MS6ujbRYwLK0BLyi5Yh3Xs7OyvPJ1ZWM0gGWpqy7gqx
 Jc2bP+sFNaD3JDKfcNI0/bE1uOgQjUw8eEqPzL0j5Y1G2Kk+mMenr86BXV9YgPMpc/
 0IWlkPLmWYLlC2BTk3P3OEeqdo53q7abIqygAFLYPCzIKe2JIGgh9R2sJBJCamX1oK
 my0ojq0XVQqTpQBAqhnxgrfhH3g2IiwbTqn55p2QoD4QrycIjHPXSrK/9/rvbT2i7X
 n+Y4rTqRfUyo2x+798x2WK5NPkiyMdXcQk4yzm00j+il8HTIgyVdSWcSgZshmJmdjG
 j/nxN2Nydh9AA==
Received: by mail.proventix.pl for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  8 Sep 2025 07:36:08 GMT
Message-ID: <20250908090659-0.1.nr.308t6.0.d56n7qe84b@proventix.pl>
Date: Mon,  8 Sep 2025 07:36:08 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.proventix.pl
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
X-Headers-End: 1uvWSX-0002YQ-2b
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
From: Adrian Liszka via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Adrian Liszka <adrian.liszka@proventix.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
