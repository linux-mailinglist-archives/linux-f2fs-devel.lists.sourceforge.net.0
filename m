Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1596AA83D05
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 10:33:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2nLN-0002x0-PE;
	Thu, 10 Apr 2025 08:33:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1u2nLM-0002wn-Av
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 08:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yodtc9kIsQSbptJKTEuPdg/78bTjKeYaJegRIfR/OIs=; b=R2nH/npSBvb4kd/oWEpk6y3klt
 i3tw3LPc/o+gCPB1bZWyF0soFowx6C7kDo1KUzIWvw7HRGeZyILiZbPhJH9rxRjm1FJxPkPDKCZhX
 /xyCPcpVsVBpkkf6/jksXrw5Pa/gOUfJjw6yUuJrNOFUQXRqYRLay2Pho9oMrI9RNPd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Yodtc9kIsQSbptJKTEuPdg/78bTjKeYaJegRIfR/OIs=; b=J
 eAT5fOwkHcUVXjpN7ivfVgmUfBZWys3dmL04D65WZ64d7CcRzFbuaADkZhR/W2NA6p2PUkKeKRCr8
 cFLpK/+brI6BP9iz6UEe7/GKgD6bojdLQBNk1+SpulhZOFh6Xc3Z3TjXsuA7L9YUVjK04cNFhFtfk
 tIaP7oqnWHjcps7A=;
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u2nL7-0000lP-Ax for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 08:33:04 +0000
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so103405066b.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Apr 2025 01:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744273963; x=1744878763; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Yodtc9kIsQSbptJKTEuPdg/78bTjKeYaJegRIfR/OIs=;
 b=Vgr05muXRynnMijaGI/ceI66zbrnhVuxaNUJY8dDr1B/YJwMZeUCWzrFo5Dz4rdx6p
 vQNJsmLvwYAOzCA1hSW+UsI5JY8CGn3zAuU9br6sEcTR1saO9N+RHlS34SIoGqVlkI7x
 4CP1t4IOdpsWxQUJ9ZupAAR3+i5BmBXxiir8e1G517SdtUb4IekehzYBqCWjjeZcp3Pt
 x8AFrZCzCbo+NqEJScGX4fb8IaqobNStlNa/6zu14ZwV33xY+DnRue03eQc4VWS0BNIL
 JPmthpKE+tIWvo7iEJ3Wk2WQ03Y2Mf+OHQvT2l6H6cRBWRTkY0jcyoGpeXPFDaoK6UuZ
 2xSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744273963; x=1744878763;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yodtc9kIsQSbptJKTEuPdg/78bTjKeYaJegRIfR/OIs=;
 b=Ko4SCEB4UHn9WM1C+tdm/oCzg4MyWp6PRocux5Vg2x7hq+xfFtfOCuGkcc+45fcc/4
 0cRmTj5+r2lQYkho3m+fVrjcQmJItLqxG8qDuJYGjVt1vedJvcgLevLbI5UNG3VbUVgi
 Cm0iBuWUBdqY9FCqpfNNzO4khZvJogn2gFO8NnI3020kKstkqahBhQob5VknXZpNscCt
 wNk5TDvf0UEWgSRAT6LTGYl1JAFiliHqXC7SWgVQnXRBe4LMpYGE/68WlId/8gsH3kP9
 SeLsDYJd8hvkU7kGVcNXHDqfmEnTw9YX/BmYpFBrI5m26SQ0CG8IUQnjxUkZWvmha7tJ
 5/bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtHnjuzGt4HITE+z0fUwvi2vh3WPHUrTOHy4TylwDs2ESkvfl8W0Px4i7slCv125sv/RUhWCYH14TT6oUJnmC0@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy9oMfyvW/ZwCzkyGWcDDI0DDSFSZG7UXu7ZMDG538BPHNXykth
 jhAEtiwCuhZGzd9sUuxYSX8kyvUG6wadoOUu0y2sDymwUPoMucXcwVM71uNTrEQM1hVBg/b8QrJ
 I/OrfW0RFeEPYxQS7TkoSkWhkr/+sfmXsTZY=
X-Gm-Gg: ASbGnctYTCGsn8ZWSkK8ysT16+pIjt9SejUgnywbt4w9rM16k4kJC05vgjCFkB9LFJZ
 9Nxg/xQNq1WAJ+FwfYK09I+ZxqgITX6orU7Jp26QJ8Yi3wq4EpisPCMo0/CxWrQZrQ98LvfA3U4
 /E26E2aURAUwlJTQwg4UxqDvo=
X-Google-Smtp-Source: AGHT+IHVMbDuDa808LMO4W9ymcIWibkTCXQJET5e7ak4XpKQj5ONq5xlER6Rkg7FRYX9jRqAHGP6hhGrhs50ExXV5H8=
X-Received: by 2002:a17:906:dc95:b0:ac6:b729:9285 with SMTP id
 a640c23a62f3a-acabd515169mr145237966b.55.1744273962468; Thu, 10 Apr 2025
 01:32:42 -0700 (PDT)
MIME-Version: 1.0
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Thu, 10 Apr 2025 01:32:31 -0700
X-Gm-Features: ATxdqUEIsXu4TxIcRgTIaFae4wqLHmGUoDnu9hHz3MGXZtIXynXVPWhWaOc7fsc
Message-ID: <CAD14+f3D6iPOBxEgkZxxTsXCfwRKb9ph68JtUk3H9cn8ovLt9w@mail.gmail.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi everyone. Besides salvaging @uplinkr's data [1], I figured
 it's important for us to understand why resize corrupts data in the first
 place. I took some time today to have my laptop's 1.8TiB f2fs partition
 resized slightly and managed to reproduce the data corruption. 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.49 listed in list.dnswl.org]
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.218.49 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.218.49 listed in sa-accredit.habeas.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: arter97.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.49 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1u2nL7-0000lP-Ax
Subject: [f2fs-dev] Reproducing resize corruption
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
Cc: uplinkr@airmail.cc
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi everyone.

Besides salvaging @uplinkr's data [1], I figured it's important for us
to understand why resize corrupts data in the first place.

I took some time today to have my laptop's 1.8TiB f2fs partition
resized slightly and managed to reproduce the data corruption.

I'm not necessarily sure whether this would be the same symptoms as
@uplinkr's, but it's probably likely.

Here's what I did:
1. Remounted to checkpoint=disable
2. Create a dm-snapshot of the current root device
3. Mount snapshot to replay the log
4. Unmount
5. Resize sector 487248896 to 486539264
# ./resize.f2fs -d 3 -s -i /dev/mapper/snap -t 486539264

Latest f2fs-tools was used:
33c5b9539af2 f2fs_io: add fragread command to evaluate fragmented
buffer for reads

This reproduced the mount and fsck failure.

Mount log:
[442431.020594] F2FS-fs (dm-2): invalid crc_offset: 0
[442431.130055] F2FS-fs (dm-2): SIT is corrupted node# 13615201 vs 13616290
[442431.139684] F2FS-fs (dm-2): Failed to initialize F2FS segment manager (-117)

debugfs & resize log:
https://arter97.com/.f2fs-20250410/

The fsck log was way too large, 8.21GiB without "-d" flag and it
contained many sensitive data, so I'm not uploading it for now.

From looking at the dm stats, the fsck also wrote 2138 MiB to the
snapshot device.

Chao, can we start from here?
Thanks.

[1] https://lore.kernel.org/linux-f2fs-devel/608f23ce-56ef-4faf-bee1-3aa89786ed41@kernel.org/T/#mc628f8f3ca6c73178ffa1716f927755527856d4b


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
