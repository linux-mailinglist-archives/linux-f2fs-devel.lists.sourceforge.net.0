Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC5A2989FA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 11:05:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=as/wjTmPZI0bim/RuifJ2Z48yrb361dvPPsPreHCOJc=; b=CBPJnf2jVrLyxCkQE/YhS37rSE
	sv8H170p0HrpgstJcPCIzScs/+Fn7zdkcCIQuJ54QIw5/A4osH7WJ+ZrFUQ3I63w16qC76R1t4CmJ
	FA/K5SCdaFXnaPlu2q02GQ1E/JT6oGLPkMsj960cpTny+LhiK3ZCAd7s/daPaAJyjG6s=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kWzNG-00045n-6a; Mon, 26 Oct 2020 10:05:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3UZmWXwgKAOATQDKPJUWIQQING.EQO@flex--robinhsu.bounces.google.com>)
 id 1kWzNF-00045g-7t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 10:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sqeklWdICtGUlm4BzSZyDT81vCJHA9YvFrN0eJR+mck=; b=he9ZJ25Z7xzlsT+TzQrOHg3m9e
 Qfyvp8f+9d+Ps6Tef1uG36iSUnm/pHpXt+UGaho9oidwgQdT2Yu2b9dnzD7ANTkgi6amPjTuVdeRo
 FbYdDRa5ykoNtmPICKzKSjgcUvnCL/Uqj9gzOlzgKVOf/OHPMGdHOnP/0o9SQP1gPdtU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sqeklWdICtGUlm4BzSZyDT81vCJHA9YvFrN0eJR+mck=; b=K
 pi2pGxxATHkHnm1tKwu3MPXPAqwM1w/U9YakWw2Y8byrTX/ee0ZT0xqOvrxFeWZpJQq6FGLUCxTOR
 Y81IBvHJs+ackbsT9seiP/fL7IXVwnSvEdemizsozPqhV6FwEiWbAiFViUw6M6jlXPi68+kClqrRs
 5+dImEA3YLg+V/E0=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kWzN5-00E1bP-9G
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 10:05:09 +0000
Received: by mail-yb1-f201.google.com with SMTP id u13so3041966ybk.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Oct 2020 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=sqeklWdICtGUlm4BzSZyDT81vCJHA9YvFrN0eJR+mck=;
 b=q0uzHGPNjB5m1DuTHX4iXRw0kDatf3gJdNLuyPAoc/OoZMHn82lSqBSuYL377RR528
 /bVZeqM166p83zgSj11HJKhhW9gUo7lXKl9RdfDAa+7AOY/3sKVIK5BTZtg8ByhHHkjm
 WH6zCR0CC2P4FYzZRF/RpMbfC2W1Te6ineAHUoWCh2su8MJua+sbQWk3svw7IUvmchYa
 yutOjAhUpFSu/S9jKvDNjHnRAvPgiZz4gUWp9UBEmswxChldZq/prb3tgQKfe3nIbDhz
 0+kUfEceCsFlW9fViKpWTGJGVSdlJcBVReSuJvgTCjZ91b/56ULdH0rTB4rz26NdxgZx
 so4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=sqeklWdICtGUlm4BzSZyDT81vCJHA9YvFrN0eJR+mck=;
 b=BvaEWaicrTFZjiLoPFGFcLcQY69LH4Zew5gZpGrwUeYp/2A7U6Zx0KjMRFxLV6aXGL
 r1ePtRjFnVOI5icV4QQvYADjlhKMU6hqiYy2gVBCVqI/YLfM1b87+h77Iryquc8EyL3N
 eZ1wF08cxQZwHL/iD8oFIKGZts8HL5BuYtq0Zc3ljwR8nbXzeLDhe0AS4oY/RgKVs/N1
 OXnxer+jtl0gHfH7ktWxGDn3ODGPY5mvSkJS40wwqvKo5JSOYXPPij6SML0yZt36AJW5
 SRkctZwEzwBSUG7aTEPC05M6jXLdrlQIKRJuskgh8b5Wt8bFN/JqNSs7UNHVtJZCIjWb
 jGvQ==
X-Gm-Message-State: AOAM5324UStf/yjZYbhOTjAqcvo5IuVaC+CSPsa4BZniE3tQPq/92EsK
 a+71Qq9yUcw8O1gpfpKr66yhnsK6dvvjXc7JS4CjxcTAYnRlln5WLxTTtHscT8nZGh4wXHHFwLA
 NepS4vAqmm+Zl490XOBHTwbG7HrMEm2B/um0dq2VkfdDe6pF0MmLlrSdYvtf05lwNV9uA4VSR88
 kyFidibrmoL00m
X-Google-Smtp-Source: ABdhPJz/h1idORhGUhGdrHKqXxETBi3Ayx3ZvwrPgqcdXpBVB/CzsBES44aCJ+epbOE6UDkQOQsramwRYyPHbw==
X-Received: from robinhsu-p520.ntc.corp.google.com
 ([2401:fa00:fc:202:1ea0:b8ff:fe77:fe45])
 (user=robinhsu job=sendgmr) by 2002:a25:da4e:: with SMTP id
 n75mr21019061ybf.425.1603705169605; Mon, 26 Oct 2020 02:39:29 -0700 (PDT)
Date: Mon, 26 Oct 2020 17:39:05 +0800
Message-Id: <20201026093905.1498859-1-robinhsu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.0.rc2.309.g374f81d7ae-goog
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, 
 chao@kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kWzN5-00E1bP-9G
Subject: [f2fs-dev] [PATCH 0/1] f2fs-tools:fsck.f2fs Fix bad return value
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
From: Robin Hsu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Robin Hsu <robinhsu@google.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs-tools:fsck.f2fs: Fix always return 1 (error) after asking user to restore
           lost files into ./lost_found

Robin Hsu (1):
  f2fs-toos:fsck.f2fs Fix bad return value

 fsck/fsck.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.29.0.rc2.309.g374f81d7ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
