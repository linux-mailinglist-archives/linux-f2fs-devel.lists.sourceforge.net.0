Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B738EBD803B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 09:53:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:To:Date:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aDzXjL5jgfLRgfBC7wFl7Op5sHjHzRngrcg1XZwUMyk=; b=PAFkPKen5Ob5aYjG0PKo4mCYWD
	VGAKWpoBN41fHpmA5CqgYDJ7C8Bx061rxiTGta/u1XMjx1SmhgHLHAY6/bfza0Y5DH/Dfvd2bqXFi
	5cX4368heVmMF1hJYhV+fypX2D03jLUuyB4coqca3N9u9Pw+aCLUiw6uLzxuxWBuRhYY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8Zqh-00072i-Vk;
	Tue, 14 Oct 2025 07:53:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kamil.lasek@bizial.pl>) id 1v8Zqg-00072W-MV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 07:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wi1EwQo/dG68GeDrjYwpMT11dLZoRMkzwMdoXACjbmg=; b=Cmqu0N2IZyspkMlahamy8uGb7L
 pSPmZuWsuNTo0DEOQo2XuUQUWH8cHgj5f0unA/a0Rul7n4BAyUG5nEk55O0IBIy98orZY5iK7vIB4
 E15mgU/weBviyYGSRk8vmrzEI2+86+iC+55YPpeCvGW34cfpTeB9vNKX4SnF5VvAFzsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Wi1EwQo/dG68GeDrjYwpMT11dLZoRMkzwMdoXACjbmg=; b=j
 voP7gVAaNDTuYSNoJEp4XOXFipHoejVYA3ZFmt64jLgtZHYUkb2HwwD5okpbWsyZNu8yM30XI820R
 YjPgtw3skhJuceeZ3iJzNL4mSQAUXqgvai4BxAYRNx25ggh5HTGaabU0rdOyp9NsFqYgB4DAiGiBg
 vDCaLxRRVBhUeotw=;
Received: from mail.bizial.pl ([141.94.21.111])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8Zqg-0006t9-RT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 07:53:35 +0000
Received: by mail.bizial.pl (Postfix, from userid 1002)
 id 6BE3F23B46; Tue, 14 Oct 2025 09:52:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizial.pl; s=mail;
 t=1760428403; bh=Wi1EwQo/dG68GeDrjYwpMT11dLZoRMkzwMdoXACjbmg=;
 h=Date:From:To:Subject:From;
 b=YPFRZ1liygkf7JWcBDQ50VdCIm8GTX6krgM/o1KKIj6h5X9ECWYM08//LLMD/2BJH
 B0safAfdrrYJCF+4QH0KmhM27fG3ZeNZ0nKII7Z2rrv2K3jyS/3Yv+hM8xsKSUdDb+
 4zvDDM6qHs123iFYOadewAzX1PpvzS5Wafo26ms+nCWe774/Q/Qm4rcYpIiEtJVEOI
 EEGziRIHTV7V/WRy89atDeq5QP+jlvOUUPU939CylYatyXbFGQsqD/4WXUNeEgoAO0
 Nm/HYvH+iY/VOCFGxamLosJJlDwibkClEpUVZJFliiPPUOECe94iPhOPtzmS19zG7g
 dKMS73havAIUw==
Received: by mail.bizial.pl for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 07:51:09 GMT
Message-ID: <20251014084500-0.1.bd.25hlh.0.x688q52mkd@bizial.pl>
Date: Tue, 14 Oct 2025 07:51:09 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.bizial.pl
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dzień dobry, pomagamy mikro, małym i średnim przedsiębiorstwom
    obniżyć koszty energii elektrycznej dzięki montażowi instalacji fotowoltaicznej.
    Aktualnie proponujemy bezkonkurencyjne warunki współpracy, od planu poprzez
    realizację aż po serwis. 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1v8Zqg-0006t9-RT
Subject: [f2fs-dev] Fotowoltaika dla firm
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
From: Kamil Lasek via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Kamil Lasek <kamil.lasek@bizial.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RHppZcWEIGRvYnJ5LAoKcG9tYWdhbXkgbWlrcm8sIG1hxYJ5bSBpIMWbcmVkbmltIHByemVkc2nE
mWJpb3JzdHdvbSBvYm5pxbx5xIcga29zenR5IGVuZXJnaWkgZWxla3RyeWN6bmVqIGR6acSZa2kg
bW9udGHFvG93aSBpbnN0YWxhY2ppIGZvdG93b2x0YWljem5lai4gCgpBa3R1YWxuaWUgcHJvcG9u
dWplbXkgYmV6a29ua3VyZW5jeWpuZSB3YXJ1bmtpIHdzcMOzxYJwcmFjeSwgb2QgcGxhbnUgcG9w
cnpleiByZWFsaXphY2rEmSBhxbwgcG8gc2Vyd2lzLgoKUHJvc3rEmSBvIGluZm9ybWFjasSZIGN6
eSBtb8W8ZW15IHByemVkc3Rhd2nEhyBwcm9wb3p5Y2plIGRsYSBQYcWEc3R3YSBmaXJteT8KCgpQ
b3pkcmF3aWFtCkthbWlsIExhc2VrCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
