Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B528C78910D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Aug 2023 00:00:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZeqQ-00079b-Io;
	Fri, 25 Aug 2023 21:59:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qZeqP-00079R-FI
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 21:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wCmT1oESbAYhZeNNKJ5ShtRN4csCjH3Kne0S41EAnjg=; b=e1ZZqgLDlY4WzKPP9aHdco8noC
 S2KHKPD+YE70mBWnbb/DVCyKPrahISmJW8UZov2OrlghI9oWnT6bKDWuz+aJFRbQpvnTkxfzcXRKg
 u8iMGKcbuIEkGxdg51iA/5WUkV7DHJHFrBUiz1lkXP8/Iz/S5xEbzh5r7KJv+4C9ye78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wCmT1oESbAYhZeNNKJ5ShtRN4csCjH3Kne0S41EAnjg=; b=huU8X0FMjTklA7gyI8e4crV2MS
 /HK5ACvUgk70c/bvjy4ThPtNe1aKcr9CM6Wnk9f9YGzwT3nUmedmlU4X9pyePhyHng822hggrL+fy
 M7s1PZREzsadUoHNIYQHML+8UD8LKLoh0obtLO2WIfXGERzFXzKRt3lJmgOkZvHLS6ek=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZeqN-00060z-PZ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 21:59:52 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-68a56401c12so1076632b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 14:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1693000786; x=1693605586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wCmT1oESbAYhZeNNKJ5ShtRN4csCjH3Kne0S41EAnjg=;
 b=41e5WqQODP0hmu8CXJSYnJoxP9CYCTQIjvtSx0suLjuCd2LQoihd/jLrKiko4xwooZ
 7dYHeAbwy4v/acegR7zM2t87koKR6b9HdwUQM9+1khEZHSlP6Ay9Gyi1BnTTJyQ+N1sf
 Tihv+CPf4TPS3j/ZySi0TL4gDqhyuMZ+nJxTaDnexRh6Pcmjy8aRHLfP/t/1vg9xEN/C
 0OJKzvJcUqwLuYg4eu+OPeBIRa0lo/YObVmgzaCCijZ7OHy87LLvHUMM6er4JE4Dhtu4
 AWYpsvb+nGYnjp1AziAY3+XfPWUVf+GXDgs/Cvrt+UTpnf3nupIw3K4PynKsZ49o3GsI
 BY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693000786; x=1693605586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCmT1oESbAYhZeNNKJ5ShtRN4csCjH3Kne0S41EAnjg=;
 b=KX6/cTCFcc+MFViUHTbJkhoNg1vklHdNcVvML0aINlBiqr2gxJn1bMdPBwQ6HCDkrX
 J7Pq1T4GJ8I5USWqNpXCCSJJFFowlS5TAlezBamAVVk4R+oo4KgXdAqB8GXFezA/KMKn
 GLdp8lClANCgYKw/Guc4OxikKx41E6Y7x22+DkuT7/vOV7tyF41kQNRli5bREImKLgfy
 DQl70ssQthq4gU7VN7xc7xKqhSY2Q+BxStgOQ75h9OxbMJ8xaLfd89QElB64TBNjmiOQ
 Vrwz7TdqgHoNHGtAgqD52NQx451mu30s/HZ3X4xvZtPn7SORsuAmtoXT8R2gtkvDCBCs
 Zo1A==
X-Gm-Message-State: AOJu0Yx2PnjTpVS0EgbZ8nEXWrl6wYwNFW1erVrt2XhVvT/0DhVaokNO
 5rmap21Cg8NFgA/2ZyMI036Lng==
X-Google-Smtp-Source: AGHT+IH1qPsbAkUY/ApYOINMHsRtAsDWZuWyGwI872JdnDKqNbs04KgeM02oT1drFck2zagaT8PEnw==
X-Received: by 2002:a05:6a00:cc2:b0:68b:a137:3739 with SMTP id
 b2-20020a056a000cc200b0068ba1373739mr11002510pfv.4.1693000786153; 
 Fri, 25 Aug 2023 14:59:46 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 g2-20020aa78742000000b0068be98f1228sm2025436pfo.57.2023.08.25.14.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 14:59:45 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qZeqF-006VO2-18;
 Sat, 26 Aug 2023 07:59:43 +1000
Date: Sat, 26 Aug 2023 07:59:43 +1000
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOkkT5Ai7wyMGcWC@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-29-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825135431.1317785-29-hao.xu@linux.dev>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 25, 2023 at 09:54:30PM +0800, Hao Xu wrote: >
 From: Hao Xu <howeyxu@tencent.com> > > Apply trylock logic for xc_ctx_lock
 in xlog_cil_commit() in nowait > case and error out -EAGAIN for xlo [...]
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
X-Headers-End: 1qZeqN-00060z-PZ
Subject: Re: [f2fs-dev] [PATCH 28/29] xfs: support nowait semantics for
 xc_ctx_lock in xlog_cil_commit()
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 25, 2023 at 09:54:30PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> Apply trylock logic for xc_ctx_lock in xlog_cil_commit() in nowait
> case and error out -EAGAIN for xlog_cil_commit().

Again, fundamentally broken. Any error from xlog_cil_commit() will
result in a filesystem shutdown as we cannot back out from failure
with dirty log items gracefully at this point.

-Dave.

-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
