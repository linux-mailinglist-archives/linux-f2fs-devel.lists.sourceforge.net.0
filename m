Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A900869AF9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Feb 2024 16:47:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rezft-0007Dh-Ku;
	Tue, 27 Feb 2024 15:47:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dan.carpenter@linaro.org>) id 1rezfs-0007DZ-AO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 15:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rFsQ+xzntBBtNZDxx0y5T00rC+M2urEBzhOfR26lHZo=; b=mtP03y47lZht0igJqf0DlfkN1A
 hR9SO+QT3pORylb9q/cTSxNvWdWbHyZiFrB9yHqyNBAlACKklMtDhv5ujtEOUHQAOV/0pcV+1l52B
 /cI3MmgjfZXR2rxjqcxmEHC9NkHzJBWkuoHKpugMdj+ZPladlVPC8Q12wCjgh4awnQAA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rFsQ+xzntBBtNZDxx0y5T00rC+M2urEBzhOfR26lHZo=; b=E
 9vEMbtBE34/k4vmpPFz5zXTcHIUf/51SzM1jDrjmlATo2r1CfXlxreejaIAuRGVoTwNrTkK+ZIU+s
 xSrapT3atOamVXF40trxjCMCDFB9Ughb4zw0lhuAb9RTFINoLGCcUtdQoqqCFVx2qL7Mr4df+5PM/
 uK81sSmUmpT7Fnlo=;
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rezfr-0001AP-V1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 15:47:20 +0000
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-33d38c9ca5bso2334133f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Feb 2024 07:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709048828; x=1709653628; darn=lists.sourceforge.net;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rFsQ+xzntBBtNZDxx0y5T00rC+M2urEBzhOfR26lHZo=;
 b=j21Fz9adozcSp4MXAjKukMsHZvjwY3QiovR3hB/iqBsvtItspfbLKcSG5lmiO35s5N
 ypudpXltJJYJqiqBmxktgI+D9YrptAFK1UPnZMdRxK39BBSbBMIEnr6730xnvqLiNemU
 kPE/vakqTums9zHneS/cuV4sfCgqaCj3DtBPmLlSXrn1nLXqKsbVA8Gg+ZZWDrH5Puyf
 SkpmxNnd0nZzZ6uAGT8g70O6LFVlgoWCftNcJPBlbKk/NnqtaQxtnHNejmF81beEjNDq
 nc1mIqDdLechh2jy0h/Qiy1KrUxmRnCW1ys7YKN+PGfJoqLeeq7tgWofxETDN3n94rDS
 7Ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709048828; x=1709653628;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rFsQ+xzntBBtNZDxx0y5T00rC+M2urEBzhOfR26lHZo=;
 b=oBTfQIYe0LFXFN7cTDjoZXnFMoQ4UzjZunMyoPsPubU+BkYLZfYkBIaByPTjoUT8bp
 h0945XFTdyOFC2hDVl78Gpug6/pr3gmMZZ1A1Ob0a3q4sMITMGN7GKHwsxyIHbNaS+YU
 sfou68o+km6nH8bpwW4XDWjttNbFc/AG245OB/evjH1T39zkg9EDizDYJiXR9q+tqtHT
 eOm6xFYwLE4FupLdg+rZ3QUkfbzr7QT7szx/1OgpQBswAwB1GEmiF8nck+S6kuvTUQGi
 AArZt5Hdh0DGLIEz5NsNvoSdGx3aRCx+63KKi3Msx4s7+hGDlsxt6aqA423vjHy7lSca
 8xeg==
X-Gm-Message-State: AOJu0YwPTQ5SYoRTssgsgaPPat8JkQjLbCHoTdrXod6IVJEEJvnlq8Dv
 H6ZOLAc3z29JpDEQ5c+GYjsGZcivBenasc4Vja+TOOKbB8RNpsqI2Gctp3WCM4a3XdiM3EtBcjP
 C
X-Google-Smtp-Source: AGHT+IH24J5GzaXT0mdz457jms0bpGvUdC3/5uQQMTNoFAv+GelL3d8gYydklajcR4FC6SiQC+WoaA==
X-Received: by 2002:a05:600c:4e8e:b0:412:a082:ef9e with SMTP id
 f14-20020a05600c4e8e00b00412a082ef9emr7136242wmq.33.1709047322478; 
 Tue, 27 Feb 2024 07:22:02 -0800 (PST)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 jn11-20020a05600c6b0b00b00412ae4b45b3sm1750985wmb.30.2024.02.27.07.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 07:22:02 -0800 (PST)
Date: Tue, 27 Feb 2024 18:21:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: zhiguo.niu@unisoc.com
Message-ID: <bb8814a4-09e1-49b7-ab13-391624a0658c@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello Zhiguo Niu,
 The patch 7a0392932f97: "f2fs: stop checkpoint
 when get a out-of-bounds segment" from Feb 20, 2024 (linux-next), leads to
 the following Smatch static checker warning: fs/f2fs/checkpoint.c:34
 f2fs_stop_checkpoint() warn: sleeping in atomic context 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.43 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rezfr-0001AP-V1
Subject: [f2fs-dev] [bug report] f2fs: stop checkpoint when get a
 out-of-bounds segment
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello Zhiguo Niu,

The patch 7a0392932f97: "f2fs: stop checkpoint when get a
out-of-bounds segment" from Feb 20, 2024 (linux-next), leads to the
following Smatch static checker warning:

	fs/f2fs/checkpoint.c:34 f2fs_stop_checkpoint()
	warn: sleeping in atomic context

fs/f2fs/segment.c
  2650  static void get_new_segment(struct f2fs_sb_info *sbi,
  2651                          unsigned int *newseg, bool new_sec, bool pinning)
  2652  {
  2653          struct free_segmap_info *free_i = FREE_I(sbi);
  2654          unsigned int segno, secno, zoneno;
  2655          unsigned int total_zones = MAIN_SECS(sbi) / sbi->secs_per_zone;
  2656          unsigned int hint = GET_SEC_FROM_SEG(sbi, *newseg);
  2657          unsigned int old_zoneno = GET_ZONE_FROM_SEG(sbi, *newseg);
  2658          bool init = true;
  2659          int i;
  2660  
  2661          spin_lock(&free_i->segmap_lock);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
preempt disabled here

  2662  
  2663          if (!new_sec && ((*newseg + 1) % SEGS_PER_SEC(sbi))) {
  2664                  segno = find_next_zero_bit(free_i->free_segmap,
  2665                          GET_SEG_FROM_SEC(sbi, hint + 1), *newseg + 1);
  2666                  if (segno < GET_SEG_FROM_SEC(sbi, hint + 1))
  2667                          goto got_it;
  2668          }
  2669  
  2670          /*
  2671           * If we format f2fs on zoned storage, let's try to get pinned sections
  2672           * from beginning of the storage, which should be a conventional one.
  2673           */
  2674          if (f2fs_sb_has_blkzoned(sbi)) {
  2675                  segno = pinning ? 0 : max(first_zoned_segno(sbi), *newseg);
  2676                  hint = GET_SEC_FROM_SEG(sbi, segno);
  2677          }
  2678  
  2679  find_other_zone:
  2680          secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
  2681          if (secno >= MAIN_SECS(sbi)) {
  2682                  secno = find_first_zero_bit(free_i->free_secmap,
  2683                                                          MAIN_SECS(sbi));
  2684                  if (secno >= MAIN_SECS(sbi)) {
  2685                          f2fs_stop_checkpoint(sbi, false,
                                                          ^^^^^
This false means we sleep while holding a spin lock.

  2686                                  STOP_CP_REASON_NO_SEGMENT);
  2687                          f2fs_bug_on(sbi, 1);
  2688                  }
  2689          }
  2690          segno = GET_SEG_FROM_SEC(sbi, secno);
  2691          zoneno = GET_ZONE_FROM_SEC(sbi, secno);

fs/f2fs/checkpoint.c
    29 void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
    30                                                 unsigned char reason)
    31 {
    32         f2fs_build_fault_attr(sbi, 0, 0);
    33         if (!end_io)
--> 34                 f2fs_flush_merged_writes(sbi);
    35         f2fs_handle_critical_error(sbi, reason, end_io);
    36 }

regards,
dan carpenter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
