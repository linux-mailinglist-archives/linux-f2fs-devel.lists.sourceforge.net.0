Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0E992B24E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jul 2024 10:40:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sR6Ot-0004vE-1m;
	Tue, 09 Jul 2024 08:40:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1sR6Or-0004v6-U5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jul 2024 08:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R4piXfEWK3JDEK/xg1SLYIYqHUcFt3KcjgoMXNE0juw=; b=ST6T+HpY6S4Ud9VsYopHT9caWk
 Mqd2+sW/mzAz4NTlpsDkAaGNrlWivZcg7dU571s2/Wvhbyl5WOiSqvZYrko+p8Ep3QnaQtUJnYDi4
 Y8yq3NCE3t1SvCFLFjM6YinJPJ3ZlCLsznLf2uzXM+rjiHBqVFRMWMkAE2o5fQkbn6JM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R4piXfEWK3JDEK/xg1SLYIYqHUcFt3KcjgoMXNE0juw=; b=ctlDpJulrMGNYEwWcNsCpvqvbE
 LN73iWfOAbVAlIeSM+02VGTSjeaq9vb71IM4jh/Jq1WxwA+h291dvHzHExRGyckwbaE0O/sMSWpXT
 zyeggvP2G1rOttW5InAP/Xf4bqREVTQqJZQBUCVj8/U9OsO8XINGJxOfz44t86aPIHc0=;
Received: from mta22.hihonor.com ([81.70.192.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sR6Oq-0002Mv-Rb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jul 2024 08:40:36 +0000
Received: from w001.hihonor.com (unknown [10.68.25.235])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4WJDsR2KYmzYmhTW;
 Tue,  9 Jul 2024 16:38:19 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Tue, 9 Jul
 2024 16:40:27 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Tue, 9 Jul
 2024 16:40:26 +0800
From: wangzijie <wangzijie1@honor.com>
To: <chao@kernel.org>
Date: Tue, 9 Jul 2024 16:40:26 +0800
Message-ID: <20240709084026.3098260-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626014727.4095350-1-chao@kernel.org>
References: <20240626014727.4095350-1-chao@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w003.hihonor.com (10.68.17.88) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, I think that we should call f2fs_remove_ino_entry
 in f2fs_evict_inode to delete ino_entry in CP_XATTR_DIR list. 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [81.70.192.198 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [81.70.192.198 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1sR6Oq-0002Mv-Rb
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: reduce expensive checkpoint trigger
 frequency
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 bintian.wang@honor.com, zhiguo.niu@unisoc.com, jaegeuk@kernel.org,
 wangzijie1@honor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,
I think that we should call f2fs_remove_ino_entry in f2fs_evict_inode to delete
ino_entry in CP_XATTR_DIR list.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
