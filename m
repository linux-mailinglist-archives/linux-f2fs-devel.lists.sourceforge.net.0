Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kr4VFKX/RmqFgQsAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Jul 2026 02:17:41 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B26E6FD95C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Jul 2026 02:17:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=fZaws+LR;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=c6e3vFXb;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=J1w5dy65;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=qcaT09r3;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSFWJ6huqDwWd7S62GleL7LPJIYF8O90GjSf/Ay0APs=; b=fZaws+LRs7yiguqnALQGTmOtgk
	44gUosxw+boBBVn3UwgkEigIZz9yFhya+MHD/lZFD24CR9JGE7LglS7GMT2FxEWMYc8bYbhF41eRx
	q7N2QsT1ivQE7CclKJSsDzRx02Y96VqcApl86uANQRBC+bm/YnLH9xl9AkLOqKooSjZg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfRb0-0007OB-RQ;
	Fri, 03 Jul 2026 00:17:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joannelkoong@gmail.com>) id 1wfRaq-0007Nz-IK
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jul 2026 00:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vU7OEUrLlyve1bXZ6P0sGV5EAt2DQDqFHvcpp7wTUdg=; b=c6e3vFXb0BDklE1QamefLYYqJa
 DFJtXMapiJ2P6m4wQ3cBHronmST5gsZb4yO1Msw8ImfKu9Dw47djsvlW9WwtoBUo+rmJt6ygg7gvm
 Icqqi3qgMqTaTfDzZdByskSv0diTMzjwXV+PiuFkA6cSB66nyu+1h/ZdASwmx97FhC24=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vU7OEUrLlyve1bXZ6P0sGV5EAt2DQDqFHvcpp7wTUdg=; b=J1w5dy65aw9Ewvcer3zC6B0RWb
 YEalfEElbguXIkbZ0BIsMjB8/ZKWIBPaGchav4absAVgMIjAn3Y8WgEbTV2VRl7mA21tEV6Utkjpt
 2UTFJtXjwqvhSmX+Gnpmgnk1ouA8OqZQ7htwQ0VAw43CeK+avGBhvLn9GftpVpP/NnOg=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wfRaq-0004DK-C5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jul 2026 00:17:21 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493c00f74baso12995055e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Jul 2026 17:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783037834; cv=none;
 d=google.com; s=arc-20260327;
 b=HnbRFuLKgd1v7tKv4hXRSR//5ZjJOmVYtU1PEDyc4EA5VNUyIrnGmRkxS4JutF52r+
 d6f4h+RrU+TROg9pQqGktuoRr46Qc8rXnWM2gL1elhP1RQ31Ct4LYjL3xsm27RjDJBo9
 pjEEvZVjfgRlPTlHaTvnPte9GWgb1VfTkGmGylDXeJydD/mi3va9m/co6isvyj76C9xP
 iCUULQi6/Ra5DePDwpuwtq7SyHM6G0HLXmldV7iv9CjZ0X7spuFOk4CHACXaReyPnJox
 qGRxv7RGRTTCmPHg9UXOYq8tG7qTBL7LzIZkMiP7EOUBvJhWcYPxBXlIWTt6PThVC8HB
 WaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vU7OEUrLlyve1bXZ6P0sGV5EAt2DQDqFHvcpp7wTUdg=;
 fh=xnvjQRrOEEd1iIe0oU8PyMWjsJGeMkA1E2om0eOHUY0=;
 b=YUe5g3LsdsCnnaxVRWFX9cZr0DKXx1yHU2pyrqtcnaf36eVadGPVwrh76/MZhYUDz/
 f1JTKGSYOt8VVa2mnIxeQ9mPRmokQqVu7CrbxNiQe7ehdHQpbPGqLaMT37dGzGGzx+ZM
 O1YYYE5rbXCRe2UsmPA2zMoBvoKys42kxSaSpjBBxAUEBNk90Vs/nbC3hwUdtYGq78Su
 PmRONmTb6De5uOwCQBLqmS7Fk04dJ+4CtgZBiPs05aEoC2e/T6cWNY1UAwLxmyv+cxuP
 jImhpnuCNOLxskUFi5uorNJnU41E725ttq+LSYINtZv3UMmHxSVlMa74cEHH6pJXHJ1R
 WUxg==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783037834; x=1783642634; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vU7OEUrLlyve1bXZ6P0sGV5EAt2DQDqFHvcpp7wTUdg=;
 b=qcaT09r3I0UiJdNYx0jlWF1hK9MZESWkCdU0DXRVAcB15XHp52ntDE7ApIrzOo/Cmb
 23WXNmAS4UhgZYi22Hut96URmeUIWfl1S9E2upLprKNRurwAzOSorYa8dpwEZgc/YbLl
 tAskM1F8LA0cVTNCXEU6GBNuhnwZtz/7tM7WFpcqvSHEhYl6UOqG57ohyPRxJr9+rSvw
 ZXoqe0JAiv9yG5XenbCuAlCq0tNbA3tiayaa7rFy3PuMrZuAK2Cz2mU3WXKM37xnAUQk
 k6KGdE/YnFWGnAMLdULZShRDquJ+5mPYPFdRdax+p4u0w5w4rn3DTUdGkshtNDOq3kIK
 LvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783037834; x=1783642634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vU7OEUrLlyve1bXZ6P0sGV5EAt2DQDqFHvcpp7wTUdg=;
 b=dDzm+AdQYLTTXOCxfX9uPWf81q+lwevR5Q/REqzigJW4PiLwnYZzNuNuZJphOkUGzs
 LAOJ2TcI//gUj8f8d2Czec1VVRtkBYHEXUVXARZ0vnYaMpF2UU+eeduQSq+86HGlxaAY
 KJznmmdOno6oaUUnfefjVnX7LusaKjCOZ3yb4a9zhG4cNtD0441AyrTu3EgFdh0DEuHy
 eMGTDDSbGJLv+2QQJ+xVJ0GT5WPh5U73MiYD6zzT47pFpXYEo7WaMlnBEMgc8VQdY7LI
 s2u2qQ2hE8RgURl4KYo2kB5sTaCZePiyDvbo+S2MIQpC1JlmW+ZbmgbhOdA42xjsvxQT
 H/8g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8X/fGgdkf1Xs3u4LwW4D0LqXwWqyGJri9ohX8CQx/lD4/Jx057vZ0IBonMotGenZ1WmxFAD+bBTJFiwErSxQvK@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyRgMNdFNoX55Ndg8p1GATpgr2JpCVbpIYOUKjtimNSJ/gLKAR+
 r4zyB42SVZVcg2GqJbxLPsLrSJR0Ylw5E8mPpLAPYGfzNs3oiYLPAEEefDBgTFFSGBm2yuEPBSX
 6e2kMlSIKCmKMVomMcDxiLBBCb0MHsaQ=
X-Gm-Gg: AfdE7cmKPUqF46zuUUlEWAbzcnWCPObOT1IMN5o7kgjy3BA8aPnCL7fvNRWNUx47osF
 /yMDppgvLcK/GzSXgrc6E94QzMY/PFmo+KYr2mUGbzKQYxwqwVNgHKBBs1CRRdjFvs4ZfLHd8DQ
 MZlyOzCI/ssQ7sP9Cxkl06FrE2jG37PUuwme6/fKOz/dRFySSFrAI/AiP3eUPbXgoTwPM1Hsmaj
 XICdHcSTkeivzfkQ4zRRZ+mg4fS+Oz/MSG0s00H1ahW9maa8+lzavw4PrC6o1to3BsanaqbSphl
 0CDw3kov0YDb6Aj2x9h86p/Um5++C5UFpSwqyVnHybaAOJiRJRGhdYMf9Jwmu6M=
X-Received: by 2002:a05:600c:46d0:b0:493:bc4a:c6b6 with SMTP id
 5b1f17b1804b1-493c2ba1d3emr113298325e9.38.1783037834179; Thu, 02 Jul 2026
 17:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
 <20260701000949.1666714-18-joannelkoong@gmail.com>
 <20260702165841.GM9392@frogsfrogsfrogs>
In-Reply-To: <20260702165841.GM9392@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 2 Jul 2026 17:17:02 -0700
X-Gm-Features: AVVi8CcxJan3XgaMiYmE7l9m1K7rjamtB3vH8NBAZsWn7x4K1BrIcNnVAJIzZPo
Message-ID: <CAJnrk1YW0gKRVvHRC+WeKoV2vrquzaC6UkipZkQ34Z0RAQDjtg@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 2, 2026 at 9:58 AM Darrick J. Wong wrote: > >
 > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c > > index
 3f0932e46fd6..0aa8abc438c1
 100644 > > --- a/fs/iomap/buffered-io.c [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [joannelkoong(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.53 listed in wl.mailspike.net]
X-Headers-End: 1wfRaq-0004DK-C5
Subject: Re: [f2fs-dev] [PATCH v2 17/18] iomap: pass iomap_next_fn directly
 instead of struct iomap_ops
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
Cc: "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Jan Kara <jack@suse.cz>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Chunhai Guo <guochunhai@vivo.com>, Dan Williams <djbw@kernel.org>,
 Naohiro Aota <naohiro.aota@wdc.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Zhang Yi <yi.zhang@huawei.com>,
 willy@infradead.org, hch@lst.de, hsiangkao@linux.alibaba.com,
 Gao Xiang <xiang@kernel.org>,
 "open list:EXT2 FILE SYSTEM" <linux-ext4@vger.kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 "open list:FUSE FILESYSTEM \[CORE\]" <fuse-devel@lists.linux.dev>,
 brauner@kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:NTFS3 FILESYSTEM" <ntfs3@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, "open list:GFS2 FILE SYSTEM" <gfs2@lists.linux.dev>,
 "open list:FILESYSTEM DIRECT ACCESS \(DAX\)" <nvdimm@lists.linux.dev>,
 Hongbo Li <lihongbo22@huawei.com>, linux-fsdevel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>,
 "open list:EROFS FILE SYSTEM" <linux-erofs@lists.ozlabs.org>,
 "open list:BTRFS FILE SYSTEM" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[joannelkoong@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:ritesh.list@gmail.com,m:jack@suse.cz,m:mikulas@artax.karlin.mff.cuni.cz,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:hyc.lee@gmail.com,m:almaz.alexandrovich@paragon-software.com,m:clm@fb.com,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:guochunhai@vivo.com,m:djbw@kernel.org,m:naohiro.aota@wdc.com,m:zbestahu@gmail.com,m:miklos@szeredi.hu,m:yi.zhang@huawei.com,m:willy@infradead.org,m:hch@lst.de,m:hsiangkao@linux.alibaba.com,m:xiang@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:viro@zeniv.linux.org.uk,m:jefflexu@linux.alibaba.com,m:jaegeuk@kernel.org,m:agruenba@redhat.com,m:axboe@kernel.dk,m:fuse-devel@lists.linux.dev,m:brauner@kernel.org,m:jth@kernel.org,m:tytso@mit.edu,m:ntfs3@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:gfs2@lists.linux.dev,m:nv
 dimm@lists.linux.dev,m:lihongbo22@huawei.com,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,m:riteshlist@gmail.com,m:hyclee@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FREEMAIL_CC(0.00)[gmail.com,suse.cz,artax.karlin.mff.cuni.cz,sony.com,kernel.org,paragon-software.com,fb.com,dilger.ca,linux.ibm.com,linux.alibaba.com,vivo.com,wdc.com,szeredi.hu,huawei.com,infradead.org,lst.de,vger.kernel.org,suse.com,zeniv.linux.org.uk,redhat.com,kernel.dk,lists.linux.dev,mit.edu,lists.sourceforge.net,samsung.com,lists.ozlabs.org];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joannelkoong@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B26E6FD95C

T24gVGh1LCBKdWwgMiwgMjAyNiBhdCA5OjU44oCvQU0gRGFycmljayBKLiBXb25nIDxkandvbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiA+IGRpZmYgLS1naXQgYS9mcy9pb21hcC9idWZmZXJlZC1p
by5jIGIvZnMvaW9tYXAvYnVmZmVyZWQtaW8uYwo+ID4gaW5kZXggM2YwOTMyZTQ2ZmQ2Li4wYWE4
YWJjNDM4YzEgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9pb21hcC9idWZmZXJlZC1pby5jCj4gPiArKysg
Yi9mcy9pb21hcC9idWZmZXJlZC1pby5jCj4gPiBAQCAtNjI2LDcgKzYyNiw3IEBAIHN0YXRpYyBp
bnQgaW9tYXBfcmVhZF9mb2xpb19pdGVyKHN0cnVjdCBpb21hcF9pdGVyICppdGVyLAo+ID4gICAg
ICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IC12b2lkIGlvbWFwX3JlYWRfZm9saW8oY29uc3Qg
c3RydWN0IGlvbWFwX29wcyAqb3BzLAo+ID4gK3ZvaWQgaW9tYXBfcmVhZF9mb2xpbyhpb21hcF9u
ZXh0X2ZuIGlvbWFwX25leHQsCj4KPiBJZiB5b3UgdG9vayBteSBlYXJsaWVyIHN1Z2dlc3Rpb24g
dG8gcmVuYW1lIHRoZSB0eXBlZGVmIHRvCj4gaW9tYXBfaXRlcl9mbiwgdGhlbiB0aGlzIHBhcmFt
ZXRlciBvdWdodCB0byBiZSBuYW1lZCBpdGVyX2ZuLgoKSG1tLi4uIG1heWJlIGF0IHRoYXQgcG9p
bnQsIGl0J3Mgc2VsZi1leHBsYW5hdG9yeSBlbm91Z2ggdGhhdCB0aGUgYXJnCmNvdWxkIGp1c3Qg
YmUgY2FsbGVkICJpdGVyIiBpbnN0ZWFkIG9mICJpdGVyX2ZuIj8KCj4KPiA+ICAgICAgICAgICAg
ICAgc3RydWN0IGlvbWFwX3JlYWRfZm9saW9fY3R4ICpjdHgsIHZvaWQgKnByaXZhdGUpCj4gPiAg
ewo+ID4gICAgICAgc3RydWN0IGZvbGlvICpmb2xpbyA9IGN0eC0+Y3VyX2ZvbGlvOwo+ID4gQEAg
LTY1MCw3ICs2NTAsNyBAQCB2b2lkIGlvbWFwX3JlYWRfZm9saW8oY29uc3Qgc3RydWN0IGlvbWFw
X29wcyAqb3BzLAo+ID4gICAgICAgICAgICAgICBmc3Zlcml0eV9yZWFkYWhlYWQoY3R4LT52aSwg
Zm9saW8tPmluZGV4LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9saW9f
bnJfcGFnZXMoZm9saW8pKTsKPiA+Cj4gPiAtICAgICB3aGlsZSAoKHJldCA9IGlvbWFwX2l0ZXIo
Jml0ZXIsIG9wcykpID4gMCkgewo+ID4gKyAgICAgd2hpbGUgKChyZXQgPSBpb21hcF9pdGVyKCZp
dGVyLCBpb21hcF9uZXh0KSkgPiAwKSB7Cj4gPiAgICAgICAgICAgICAgIGl0ZXIuc3RhdHVzID0g
aW9tYXBfcmVhZF9mb2xpb19pdGVyKCZpdGVyLCBjdHgsCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmYnl0ZXNfc3VibWl0dGVkKTsKPiA+ICAgICAgICAgICAgICAgaW9tYXBfcmVh
ZF9zdWJtaXQoJml0ZXIsIGN0eCk7Cj4gPiBAQCAtNjg4LDIyICs2ODgsMjIgQEAgc3RhdGljIGlu
dCBpb21hcF9yZWFkYWhlYWRfaXRlcihzdHJ1Y3QgaW9tYXBfaXRlciAqaXRlciwKPiA+Cj4gPiAg
LyoqCj4gPiAgICogaW9tYXBfcmVhZGFoZWFkIC0gQXR0ZW1wdCB0byByZWFkIHBhZ2VzIGZyb20g
YSBmaWxlLgo+ID4gLSAqIEBvcHM6IFRoZSBvcGVyYXRpb25zIHZlY3RvciBmb3IgdGhlIGZpbGVz
eXN0ZW0uCj4gPiArICogQGlvbWFwX25leHQ6IFRoZSBpb21hcF9uZXh0IGNhbGxiYWNrIGZvciB0
aGUgZmlsZXN5c3RlbS4KPgo+ICJUaGUgaW9tYXAgaXRlcmF0aW9uIGZ1bmN0aW9uIGZvciB0aGUg
ZmlsZXN5c3RlbSIgPwo+Cj4gVXNpbmcgdGhlIHRlcm0gImlvbWFwX25leHQiIGluIHRoZSBkZWZp
bml0aW9uIGZvciBpb21hcF9uZXh0IGlzbid0IHRoYXQKPiBoZWxwZnVsLgoKQWdyZWVkLCBJJ2xs
IHJlcGxhY2UgdGhpcyB3aXRoIHlvdXIgc3VnZ2VzdGlvbi4KCj4KPiA+ICAgICAgIHJldHVybiBy
ZXQ7Cj4gPiBAQCAtODI0LDE2ICs4MjQsMTYgQEAgeGZzX2ZpbGVfZGlvX3dyaXRlX2F0b21pYygK
PiA+ICAgICAgIHVuc2lnbmVkIGludCAgICAgICAgICAgIGlvbG9jayA9IFhGU19JT0xPQ0tfU0hB
UkVEOwo+ID4gICAgICAgc3NpemVfdCAgICAgICAgICAgICAgICAgcmV0LCBvY291bnQgPSBpb3Zf
aXRlcl9jb3VudChmcm9tKTsKPiA+ICAgICAgIHVuc2lnbmVkIGludCAgICAgICAgICAgIGRpb19m
bGFncyA9IDA7Cj4gPiAtICAgICBjb25zdCBzdHJ1Y3QgaW9tYXBfb3BzICAqZG9wczsKPiA+ICsg
ICAgIGlvbWFwX25leHRfZm4gICAgICAgICAgIGRvcHM7Cj4gPgo+ID4gICAgICAgLyoKPiA+ICAg
ICAgICAqIEhXIG9mZmxvYWQgc2hvdWxkIGJlIGZhc3Rlciwgc28gdHJ5IHRoYXQgZmlyc3QgaWYg
aXQgaXMgYWxyZWFkeQo+ID4gICAgICAgICoga25vd24gdGhhdCB0aGUgd3JpdGUgbGVuZ3RoIGlz
IG5vdCB0b28gbGFyZ2UuCj4gPiAgICAgICAgKi8KPiA+ICAgICAgIGlmIChvY291bnQgPiB4ZnNf
aW5vZGVfYnVmdGFyZyhpcCktPmJ0X2F3dV9tYXgpCj4gPiAtICAgICAgICAgICAgIGRvcHMgPSAm
eGZzX2F0b21pY193cml0ZV9jb3dfaW9tYXBfb3BzOwo+ID4gKyAgICAgICAgICAgICBkb3BzID0g
eGZzX2F0b21pY193cml0ZV9jb3dfaW9tYXBfbmV4dDsKPiA+ICAgICAgIGVsc2UKPiA+IC0gICAg
ICAgICAgICAgZG9wcyA9ICZ4ZnNfZGlyZWN0X3dyaXRlX2lvbWFwX29wczsKPiA+ICsgICAgICAg
ICAgICAgZG9wcyA9IHhmc19kaXJlY3Rfd3JpdGVfaW9tYXBfbmV4dDsKPgo+IFByb2JhYmx5IG91
Z2h0IHRvIGJlIGNhbGxlZCBpdGVyX2ZuLCBvciBhdCBsZWFzdCBzb21ldGhpbmcgdGhhdCBpc24n
dAo+ICJkb3BzIi4KCk5pY2Ugc3BvdHRpbmcsIEknbGwgcmVuYW1lIHRoaXMgaW4gdGhlIG5leHQg
dmVyc2lvbi4KClRoYW5rcywKSm9hbm5lCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
