Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 259436C7D24
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Mar 2023 12:21:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pffU3-0001K7-Vz;
	Fri, 24 Mar 2023 11:21:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <colin.i.king@gmail.com>) id 1pffU1-0001K1-Un
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 11:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:Cc:
 To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0xv+mNtTjOwpBHKb8GKtrxehmmp8291b5lSijCZpo2M=; b=TkfCkaHuNLdBX92AZTcvauXIeh
 4QyF2XALbbmIhxpyx/+LqsluEU60GV6uWGY1AXhXo93+b/hdXhGvrc/IpXDfAaFAKHEwriqTmfQzs
 Q5F6bQg/QvOKCFLbnXxNwFSu080q6ysKShgQuhF/RSPDXqwXQFFUQWunatI38oM0UJB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:Cc:To:From:MIME-Version:
 Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0xv+mNtTjOwpBHKb8GKtrxehmmp8291b5lSijCZpo2M=; b=A
 6uJzIvrwk64ZcRmAkPaAuu2x2j05V6wRq6a/5oxqLucckJg4OvD1k2XtqsdWcHu845a2mDv04WTdm
 2BfGNoG7vwgUC6pPcqC7UvfmZp9bmA+/Kwv5bh3AY/WLtdnZ6phYvROtLA7KIaHHayIbc5fbZM3Hr
 iU+8Q8tnK/ZSC+fU=;
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pffTz-001Xcw-O8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 11:21:23 +0000
Received: by mail-wm1-f52.google.com with SMTP id
 j18-20020a05600c1c1200b003ee5157346cso2956184wms.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Mar 2023 04:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679656873;
 h=content-transfer-encoding:subject:cc:to:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0xv+mNtTjOwpBHKb8GKtrxehmmp8291b5lSijCZpo2M=;
 b=HuA2P+Axbp378wEn0s9/x4Yo8i3Od1knU145ZeLcEsCgQPLYA8N2ML/M7LUzGAIQkm
 Ep18Pj30tpphoEw1yT09MKR43VxVWb7VsTmY8aeomzhCP1RT6z1SzialPE3n1fTYUWLY
 4b7KhUXiOtpbHgb//g3Q/Bnuu03jkuC0O3KFRHGYoxyP09OZDcoMryVepCsAhwKPGub7
 AgxvExRxeJZ1N7WVgFrU8L1ilPUBBVgmDXQBZR7FMIznSpYNNV2wdssl4z19x0bkIZbq
 gNIpTMFLRnPjVab0dSjU8vQ2Zs4g5jyHHMb2ZRSMVrnT+pPnhkf4nN75qZlq9ITxg+sW
 tOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679656873;
 h=content-transfer-encoding:subject:cc:to:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0xv+mNtTjOwpBHKb8GKtrxehmmp8291b5lSijCZpo2M=;
 b=oIpZ/E6Rn/hsRnqbGBb2JtO/RfIGRL0L4l/rz9pzaIt1NCHtgTg8R79aIC0HBHQNOM
 i9cvXCWMqbYI0F32x26ybyBQFtKV71/2uXBMmspIAdMOsNsUrFtgoAeUWHV0gCYY6zbn
 4ftgPiWj/tc+2ApxFs4/gXP+ZKv8TiLCdtJ2SnxZajKaTxQN9NnH4I/vmKANyvsIY/PH
 ZyZB+ajzSi15OwJBU0woWV2gRtwcZdUjnxCT0YHqsCorg2RvHahb6lEtt61zMud6xgFT
 dcv0tZjOUcoYl63Jl6pLhTOqMIpOXpLkVfvjYBK6G+fQugtf/Q4k384M5JYTJUCDX+QT
 0LTg==
X-Gm-Message-State: AO0yUKUznSrnD45XsIJYgfYS2LmRB2vhxDQO7cH9EOoiQX6NDKCgqLE+
 g+G4yTdP48XNErInNAr4nfo=
X-Google-Smtp-Source: AK7set+vAK+YrCS5/U3GOCqpd6jNW6jOgX7VnHc3aRQBrB3AVpAl5wBs7nZkuiRjcpTKrmpOFveSiQ==
X-Received: by 2002:a1c:f217:0:b0:3ee:5c4c:bdb0 with SMTP id
 s23-20020a1cf217000000b003ee5c4cbdb0mr2079165wmc.39.1679656873188; 
 Fri, 24 Mar 2023 04:21:13 -0700 (PDT)
Received: from [192.168.0.210]
 (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
 by smtp.googlemail.com with ESMTPSA id
 w4-20020a05600c474400b003edc9a5f98asm4775443wmo.44.2023.03.24.04.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 04:21:12 -0700 (PDT)
Message-ID: <e50ebe1a-73a0-5800-71e3-0ddd366727ac@gmail.com>
Date: Fri, 24 Mar 2023 11:21:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
From: "Colin King (gmail)" <colin.i.king@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi,
 static analysis with clang scan build has detected a potential
 issue introduced by the following commit: commit
 7e9775a516ff6c1e73ee2b42ec563cafee38f42f
 Author: Jaegeuk Kim Date: Fri Mar 10 11:12:35 2023 -0800 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.52 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [colin.i.king[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pffTz-001Xcw-O8
Subject: Re: [f2fs-dev] f2fs: factor out discard_cmd usage from general
 rb_tree use
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

static analysis with clang scan build has detected a potential issue 
introduced by the following commit:

commit 7e9775a516ff6c1e73ee2b42ec563cafee38f42f
Author: Jaegeuk Kim <jaegeuk@kernel.org>
Date:   Fri Mar 10 11:12:35 2023 -0800

f2fs: factor out discard_cmd usage from general rb_tree use


The warning is as follows:

fs/f2fs/segment.c:1425:4: warning: Value stored to 'tdc' is never read 
[deadcode.DeadStores]

The while loop in function __update_discard_tree_range is as follows (+ 
my annotations):


         while (1) {
                 struct rb_node *node;
                 struct discard_cmd *tdc = NULL;

### tdc is set to NULL

                 if (prev_dc) {
                         di.lstart = prev_dc->di.lstart + prev_dc->di.len;
                         if (di.lstart < lstart)
                                 di.lstart = lstart;
                         if (di.lstart >= end)
                                 break;

                         if (!next_dc || next_dc->di.lstart > end)
                                 di.len = end - di.lstart;
                         else
                                 di.len = next_dc->di.lstart - di.lstart;
                         di.start = start + di.lstart - lstart;
                 }

                 if (!di.len)
                         goto next;

                 if (prev_dc && prev_dc->state == D_PREP &&
                         prev_dc->bdev == bdev &&
                         __is_discard_back_mergeable(&di, &prev_dc->di,
 
max_discard_blocks)) {
                         prev_dc->di.len += di.len;
                         dcc->undiscard_blks += di.len;
                         __relocate_discard_cmd(dcc, prev_dc);
                         di = prev_dc->di;
                         tdc = prev_dc;

### tdc is set to prev_dc, however, it is not not read any more with th 
introduction of the "goto next"" statement introduced in the commit 
mentioned earlier

                         goto next;
                 }

                 if (next_dc && next_dc->state == D_PREP &&
                         next_dc->bdev == bdev &&
                         __is_discard_front_mergeable(&di, &next_dc->di,
 
max_discard_blocks)) {
                         next_dc->di.lstart = di.lstart;
                         next_dc->di.len += di.len;
                         next_dc->di.start = di.start;
                         dcc->undiscard_blks += di.len;
                         __relocate_discard_cmd(dcc, next_dc);

### tdc is always NULL, there is no path to this code where tdc is ever 
set to a non-NULL value.

                         if (tdc)
                                 __remove_discard_cmd(sbi, tdc);
                         goto next;
                 }

                 __insert_discard_cmd(sbi, bdev, di.lstart, di.start, 
di.len);
  next:
                 prev_dc = next_dc;
                 if (!prev_dc)
                         break;

                 node = rb_next(&prev_dc->rb_node);
                 next_dc = rb_entry_safe(node, struct discard_cmd, rb_node);
         }




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
