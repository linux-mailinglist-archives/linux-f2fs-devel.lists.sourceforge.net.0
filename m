Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B36591CB02
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Jun 2024 06:38:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sNPr9-0007jo-33;
	Sat, 29 Jun 2024 04:38:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1sNPr7-0007ji-Oj
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Jun 2024 04:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:From
 :To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UqqQQ4mtWWtn5nLR8B2fldnPGH4Xlw8bfev3Nm/N+X0=; b=UVxHUdKKQfsqWWTgxLCOOAvF7O
 tLLgi2hZcXBBmfGioc70kWUGuEIjSe9qkZQdpqoQ191Kjke9E7ZgDtkocOGTIjS33eXlvFt9R+3cp
 Aq0C/nQXAHjSpudsEUZuTS8SOrnAeZiaBRKSOk0PGhkyRN34mUypeu4F+paaaV8zJkXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:To:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UqqQQ4mtWWtn5nLR8B2fldnPGH4Xlw8bfev3Nm/N+X0=; b=m
 Pl0IOBCgPIws3uJFtUX+yMxUbO4y1514jOS+NZs6a3so6J67H50tKb6HRM9vVLaRKq+QqbLT63udW
 uhAUJ0Wuras7C/RSIJsGYg5gSCLA1X57cKo/ERRzOtg4BjMJkmxNGW9oribdH62fm5a+AFvpufBSy
 B6LbpugZ1bvE9Gfw=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sNPr8-0000fO-Tu for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Jun 2024 04:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719635902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UqqQQ4mtWWtn5nLR8B2fldnPGH4Xlw8bfev3Nm/N+X0=;
 b=OyKrCDioS1+aoY73in1fAz4L21T/gz3fQPO+7PvUl971NOM/PlT2vFsX1U7Ly7xXGv3eZe
 7/SfEXNB5rLhfJvJ38Z4GZqMbk7Co8MvlThXZbkH3H6b2kjNP8854wpDeb6ZELfxpvJM55
 sfJa3FkQhkNyU+opHtwy1I2kXaOtBkY=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-ZSTAhkjuNK-CIOQv6ojSNA-1; Sat, 29 Jun 2024 00:38:21 -0400
X-MC-Unique: ZSTAhkjuNK-CIOQv6ojSNA-1
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-7f62e084a4fso14516539f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Jun 2024 21:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719635900; x=1720240700;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UqqQQ4mtWWtn5nLR8B2fldnPGH4Xlw8bfev3Nm/N+X0=;
 b=cem/8imZ8+38e44IwG1P6I78fCElmFD8vfqAxuVCxrHp5T5Gmgjqf+iLytZBXlAQu2
 qv6jWxh5JajLgHvoA5InONCfDqtc591UYTWiyrEKhiceInvegBq0VKuErPycotl6Es2P
 m/pMkKMOswNYn+yPLDJXYmw7seOlaieO7kGvy9bLIgQwqkQmW9EOW4kVd5m5iTDvUhyO
 IwIxhqzJgft1QbHEmGOJyR/bWjSMnRptk9XJy6DekG3zl6XVZdLmiLX60hwoCWhUhgD2
 Qe7i5hRqTidYeG4PT0fdDGfZgaIw+h86hHunBUi4vmUy/gOEcsyQOuSMUN3v3U3D6j0X
 z7Kg==
X-Gm-Message-State: AOJu0YxUH5ModA5flq1RvYQoEvxB7ntNeJa8PTpK9WBtnKgM+Xco7ATd
 rGPrXIVZkAEna6J9Sp/kBFLPAHeox3aMSy047BAOhBZ44Uco2hjHVezUxl53nrMuzhEkgjFiVnS
 yxMALSW3oidf4xSj0ZQG2OvOfmGtqa/lujM3FDnjAe/QByeg6BiCKSwtBJbAsla1L33y0ylnmMI
 N/tMKlKyKwnH5cbk/HdGIDI+ydSMpE1Z3ohcuLdM6LS8RtMOhodQcpfdCnSA==
X-Received: by 2002:a05:6e02:1fe5:b0:376:410b:ae69 with SMTP id
 e9e14a558f8ab-37cd1a83676mr1165525ab.15.1719635900042; 
 Fri, 28 Jun 2024 21:38:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN5Ukgc2jsOw2hkB45ilkLo3Fy7XPb34CS9QhsGahL9pi3fjh9sapqJ1Zn/NoBooCfszGUyQ==
X-Received: by 2002:a05:6e02:1fe5:b0:376:410b:ae69 with SMTP id
 e9e14a558f8ab-37cd1a83676mr1165215ab.15.1719635899074; 
 Fri, 28 Jun 2024 21:38:19 -0700 (PDT)
Received: from [10.0.0.71] (sandeen.net. [63.231.237.45])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-37ad4370cfasm7301665ab.54.2024.06.28.21.38.18
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 21:38:18 -0700 (PDT)
Message-ID: <e7e1d63e-b6d2-495d-ac1f-28d87d56ca09@redhat.com>
Date: Fri, 28 Jun 2024 23:38:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-f2fs-devel@lists.sourceforge.net
From: Eric Sandeen <sandeen@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The lazytime/nolazytime options are now handled in the VFS, 
 and are never seen in filesystem parsers, so remove handling of these options
 from f2fs. Note: when lazytime support was added in 6d94c74ab85f it made
 lazytime the default in default_options() - as a result, lazytime cannot be
 disabled (because Opt_nolazytime is never seen in f2fs parsing [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sNPr8-0000fO-Tu
Subject: [f2fs-dev] [PATCH] f2fs: remove unreachable lazytime mount option
 parsing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The lazytime/nolazytime options are now handled in the VFS, and are
never seen in filesystem parsers, so remove handling of these
options from f2fs.

Note: when lazytime support was added in 6d94c74ab85f it made
lazytime the default in default_options() - as a result, lazytime
cannot be disabled (because Opt_nolazytime is never seen in f2fs
parsing).

If lazytime is desired to be configurable, and default off is OK,
default_options() could be updated to stop setting it by default
and allow mount option control.

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---

(I came across this when looking at mount API conversion, which still
has not gotten very far, sorry!)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1f1b3647a998..12bf7f014fc4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -151,8 +151,6 @@ enum {
 	Opt_mode,
 	Opt_fault_injection,
 	Opt_fault_type,
-	Opt_lazytime,
-	Opt_nolazytime,
 	Opt_quota,
 	Opt_noquota,
 	Opt_usrquota,
@@ -229,8 +227,6 @@ static match_table_t f2fs_tokens = {
 	{Opt_mode, "mode=%s"},
 	{Opt_fault_injection, "fault_injection=%u"},
 	{Opt_fault_type, "fault_type=%u"},
-	{Opt_lazytime, "lazytime"},
-	{Opt_nolazytime, "nolazytime"},
 	{Opt_quota, "quota"},
 	{Opt_noquota, "noquota"},
 	{Opt_usrquota, "usrquota"},
@@ -918,12 +914,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			f2fs_info(sbi, "fault_type options not supported");
 			break;
 #endif
-		case Opt_lazytime:
-			sb->s_flags |= SB_LAZYTIME;
-			break;
-		case Opt_nolazytime:
-			sb->s_flags &= ~SB_LAZYTIME;
-			break;
 #ifdef CONFIG_QUOTA
 		case Opt_quota:
 		case Opt_usrquota:



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
