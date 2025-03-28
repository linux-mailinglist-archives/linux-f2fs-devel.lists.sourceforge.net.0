Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E24A749EC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Mar 2025 13:41:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ty91R-0004ur-OF;
	Fri, 28 Mar 2025 12:41:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao.sigma@gmail.com>) id 1ty90b-0004th-Cp
 for Linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 12:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6euDKESeEMnFVlUs3oNfEh+haXgPytg5QlqrvV0Al0k=; b=E+xHuI8opMOMVqE0l+yJEv6By/
 6RtCHZWBMh4u3ejFNsVtawAuaiws4jYRG4vMY49k10KUkfsQTqHOMe59fuQFUm46bMdva+IMZ93jj
 /g6SKnLJZhUQqhPJvRh25JIkbrrNZ5La0FrkMBnk6q+hB9pL5aBKlE+7pgj20hswMUP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6euDKESeEMnFVlUs3oNfEh+haXgPytg5QlqrvV0Al0k=; b=C1i96aZlNfNOymUbC667+QOxqe
 MXX2uwEh0ddQT7JAFHEwrtbO9+Ug8dzbbFncFhAXxO42ZjAb+RhX4Es6Xb/Xhwv2UYhqMWrDZ8XRC
 h9tljt0c+HQM4sEnbs/gbPAymFZcHga22Oq7F9YSlnDE1p57SDDDi9C+QIYDx17kt8MY=;
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ty90N-00029O-85 for Linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 12:40:24 +0000
Received: by mail-ot1-f66.google.com with SMTP id
 46e09a7af769-72c173211feso703791a34.1
 for <Linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Mar 2025 05:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743165605; x=1743770405; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6euDKESeEMnFVlUs3oNfEh+haXgPytg5QlqrvV0Al0k=;
 b=C/AUYU4UDkuParx+5JBkobNAUZxJQZZNqvlgmTPvoLg7TwG4nTD8/t9nar1lTj8gNj
 Bv9knQW4m9VDKxUW8do5bxlnhrgPOQybHr60wq/9qJj8IeaXOQk78He22s2Akna0O340
 jkt890WCosTPDKK1NUMbesBkLldFJOOUKzTfjPP6yyZM0aBk+k8eYCnBfrrR6kjm+a0/
 fHaIiXyqL9INRsFKN6krQCV9/SKIESkNNvTgcPAQNjqk37e7DaX85CXaS/3rzE1cPc+9
 4l9A65p9UQr7TSvCNdZSisKA98lSW1VnA7cycYPnMx6vBmrBfjsJffAQ3s2YL26MSX4p
 4fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743165605; x=1743770405;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6euDKESeEMnFVlUs3oNfEh+haXgPytg5QlqrvV0Al0k=;
 b=d9ozyBVS+Pvn7Qn5M+2duy0fU+W8QjQYzZS69Smh7ia1vNJ/fPNXDD7Rp1rXa3tbeI
 Tr/4HTyXqMCGi+7ukEFcu3RX/teMQqiXGlobgTsMHGTmrVigazhYAkq78mAqgQHZPT8Y
 xKOEmo+NRrGC53pxNX18HOGZlmWCl265J2/PHhT2OKC/HbyzxUKeSxmlq0DuNj38P+pK
 cQcyCd32ht4wUTjJqasArWvuydwVlS2XH8VnV+hGNYhn2PXXvJ/IZTMytt6oLoGaIRk3
 jEby8lGgR2X7veKT5zfpJYMHQmDUT6OiL7ThNf/ClVEh/mPnEm9h9yo6P4mdgb1ymva+
 tZLw==
X-Gm-Message-State: AOJu0YwGC0Ukld2mQ4hZ+9pzGyjWo7cE+qoebH5Tvs2Jdam6eQDkXQrU
 SIp6/L+f3nPJfmPg8hdErhIpcTS71rVG2J4NVVgbPZZbA4BFC+h5geckRUm0Wj3PrLcDWWr3ote
 u/NqPjkT+jVn/wuYHcTUAkWK1UoCp5tR/ekGr4g==
X-Gm-Gg: ASbGncu2cpYJ+YVReDt7i5PA2Kk2tNUJ2YgJUOW25Sde6K5Xhq4jk8VOKdv2n2IVYZo
 uzCpOOseBgkVcav389gjSdC1rHEgOQjqLRygSE4sV//aTXYwRYL8pMBeqZeeM3Gzf6mvArdHW3U
 ejFFgyLS4+SRQ8OUSo6j3ef1TvCV00AxnC0eCLIg==
X-Google-Smtp-Source: AGHT+IHcYq8+3d1RBdKRXMEo+5v9hNSgz5SHB8zcOy45eGZSy+wRpJf1yHgpxQyftSy19NVLcZ8xr41bSaValh7w+J0=
X-Received: by 2002:a05:6830:91b:b0:72b:8a8b:e032 with SMTP id
 46e09a7af769-72c4c94440fmr5061493a34.2.1743165605294; Fri, 28 Mar 2025
 05:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAMLCH1FEuoDxFFQ8HuUdBDMfzsyaS2LWyVh+eyGCpgxnKGa7rA@mail.gmail.com>
 <Z-Aai24gPXWQp8qi@casper.infradead.org>
 <CAMLCH1HsT+AVZSXAh8Q7Zr9C3SzaegfMdE6fzKp0X0FDt9JSbA@mail.gmail.com>
 <Z-KAP6Jz_bjuPuyx@casper.infradead.org>
 <Z-Lr_xtkYakqpf0j@casper.infradead.org>
In-Reply-To: <Z-Lr_xtkYakqpf0j@casper.infradead.org>
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Date: Fri, 28 Mar 2025 20:39:54 +0800
X-Gm-Features: AQ5f1Jpgcb1FY5hEUaX_jojL88XK4YiNYdTrGOBD0meD6_Erut7xLLsfRfj_F7g
Message-ID: <CAMLCH1FThw2hH3pNm_dYxDPRbQ=mPxXAdzsgSXHpa4oBzK80CQ@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Dear Mr.Mattew: Thanks for your reply! >The fundamental
 problem is that f2fs has no per-block data structure. In > ext4,
 that's struct buffer_head.
 For XFS, it's struct iomap_folio_state. > For btrfs, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.66 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.66 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.66 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [nzzhao.sigma[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.66 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ty90N-00029O-85
Subject: Re: [f2fs-dev] Inquiry regarding plans on vmscan pageout supporting
 fs writepages
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
Cc: Linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear Mr.Mattew:
Thanks for your reply!
>The fundamental problem is that f2fs has no per-block data structure.  In
> ext4, that's struct buffer_head.  For XFS, it's struct iomap_folio_state.
> For btrfs, it's struct btrfs_subpage and for bcachefs, it's struct
> bch_folio.
Yes,now I'm fully aware of the seriousness of this problem.And I saw
your most recent discussion with Mr.Jaegeuk Kim(about setting folio
order fixed to 2 to address the problem of mounting a 16KB block size
f2fs to a 4KB page size kernel).May I ask if you currently think that
continuing the work on folio support for f2fs is still valuable?
> Either f2fs needs to grow its own, or it needs to share iomap with
> XFS.  Both options are a lot of work; iomap doesn't support all the
> functionality that f2fs needs.  But btrfs is looking to move to using
> iomap and it has some of the same needs that f2fs has, so perhaps you
> can help each other.
Recently I have studied iomap related code of XFS.As far as I know,XFS
is the only fs that support iomap for readhead operations in buffered
read.F2FS and ext4 now have 'filemap_read' called in buffered read
path but they eventually call their legacy mpage_readpages function to
perform the actual io behaviour.
The fundamental problem is iomap is ideally suited for extent-based
file systems like XFS Btrfs, however, it currently has poor
compatibility with indirect pointer based file systems.So, based on
the experience of adapting iomap for XFS, migrating it to f2fs is
quite difficult, I suppose.It's possible that ext4 and f2fs are in
similar situations in some respects(ext4 has indirected-based file and
extent-based file simultaneously).I haven't saw the patch for ext4
enabling large folios
make readahead supporting iomap.
But here's another problem.Due to f2fs's lack of a per-block data
structure, all meta blocks(i.e. node blocks NAT blocks) are directly
read into the page cache when performing block mapping, while ext4
places them in buffer heads.In F2FS meta blocks are treated partially
like file data blocks.They have their own inode,own address space and
their own page cache.So in conclusion using iomap to bypass a
per-block data structure in F2FS can be a hard task.
>
> The other is that you could help out with the ext4 large folio conversion.
> There are already patches for this:
> As the cover letter says, "with the exception of fsverity, fscrypt,
> and data=journal mode."  So you could perhaps apply this patch series
> (patch 1 is now obsolete), and try to make fsverity work.
Thank you very much for recommending the two projects!
For fscrypt suporting large folio,maybe ext4 and f2fs can share
experience.f2fs supports encrypt pages too and don't support large
folio either.So yes just as you mentioned it can be generally help.
Best regards.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
