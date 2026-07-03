Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id invGGN8UR2pGTAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Jul 2026 03:48:15 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB796FDCA2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Jul 2026 03:48:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=QCIRVvd6;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Y3jf3R0p;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=ISHGIhkw;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=dXxxmNqK;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+cLETvCW/hCZGTmgBNDPhD9UsItxX1Bm58WKvzJBco=; b=QCIRVvd6mMwY9SgypdeviaUaar
	Nale9ESubVUGjj3KJvV2Q0k7lJTHBAafMz35STRObqeHLt2NjBodN1ItzgP2fE/aFu7AIBNK8ovPJ
	zLN4PdCC8Kor8LKdZb/QV/wvAWx1IPAwdv6Oz0eNFyXQE305IS+rlIafG48la0p//aq0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfT0j-0004vA-FT;
	Fri, 03 Jul 2026 01:48:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joannelkoong@gmail.com>) id 1wfT0i-0004uw-1z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jul 2026 01:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DOn6vRfEsVTpudhzzAfawUs56a4yn/B/CVb7CXUItZw=; b=Y3jf3R0p1S1/rJbSD0Y5VKBQqL
 mURmGSlb9IA5eOjf87tWj9F2t4DRhQmAV8Fk/6u5IwMx9HlooXpRvZxd9I549Z6V/nYhRDvHTIcrx
 ljYq+eZ37YtaVX0gQjq59wLCtEdBvxOW4BEGEfoujGowC7mfdoOFmhdwYqtAYgiy58nA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DOn6vRfEsVTpudhzzAfawUs56a4yn/B/CVb7CXUItZw=; b=ISHGIhkwD3MJOqf2kaHaDDS938
 lsw8xHnWLFfs1oPJ78h9B+ZzcURDq4dDNNVsV2oB/04TozAHYHtpuyBa8sgBGz4aSNCqFiksTZWU/
 l+3+VXn62ZAgIWCl3Tyak+XqqcJSLUAh72/isMRTW7xFBcFSIjhD2MbDXeP0ad/70zyY=;
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wfT0h-0008QN-QB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jul 2026 01:48:08 +0000
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-4629051c946so28064f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Jul 2026 18:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783043277; cv=none;
 d=google.com; s=arc-20260327;
 b=c9cw5R8otlSefCAVF7raoevgGpzA8EwBEAw7Y8ZS0498V961rZ1aulC8xQfLVpA9Iy
 QhNZ1YRyyEqjRel6h0MiMioRKS0De5IYzO4kYDin1gRRcOXI1k4VCkvmR5orOZoQ+DqS
 FfyIpMIakL9eTVU2H5BwhWmnQzeqChhmOlfNJpDy8HkPzRfwiXTk95n9QeirAmhrg4+Y
 z5ZjubGj6ogl261G+cVXHdOA56oKW8lOtMa5AOzTFuR043mXGs4NSs6yzZvX2VFzIT35
 L3zfExXG50HPk04cJ8Jpp8d9ceHrXQhzI8oIXa4NNmtTijZHKPvipg0jezBPN3yLkbY6
 ia5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DOn6vRfEsVTpudhzzAfawUs56a4yn/B/CVb7CXUItZw=;
 fh=jbVVo/pF0ftqmGVFMI1j48+kBJNd4ydlaoW0ciwJvcE=;
 b=On6ubVHBc+VHRRfmhun4iVWUffyagnkkjujUBXrTZ9lU9HGj4oPddhFU1p3KgndNxb
 3LUVlYXowbT6Pq09ezaEgS3G484+mBxY4j5Q6l6fmX8hxN2MeiEPAsyTpuOIyfJs6VE+
 LHfRL5s+dbofgZLC1q3gp+HLfwKga5zcjiO+p4OdTcF0lzfARAxU3cz54XpdhdTVl8NH
 ENfPpduBdBBZt/3cW+0mMI4Ihl+Uw+GeYdAEqSggCpHry7/tUp+w4jucUgCxeASspFhC
 Apk3GAUPC9f/6Z+a3tVggmMO/VdNqqPhaXwCplqENzKvqYqv9kk23b5Zj4eQXYROAfUS
 OjXA==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783043277; x=1783648077; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DOn6vRfEsVTpudhzzAfawUs56a4yn/B/CVb7CXUItZw=;
 b=dXxxmNqK2JFZNeVuj+ke2aHPhbDaryvly+2h1p16iTpsYRo3Wt+sWy3fpW+6L/Kvf4
 dpBTBsqvwJ+nRWxuBh6Uj02yF2/ei3+8S+Emhl3sL4Q8g7SVp7jKl1PC9qKp/taVPn+Y
 7kpCo/RPeBFVUTtpy3lHDy9rmWpraflzsm8VB6vFi1FCk2e9SjxwsioxB8U9J+3vyRq6
 EUZZGosdRGYZC8y/huFp0+LFKoK/OI//IrMEKRFBnt7qu1Cm8AIXBdFF4sbDt1DtRlYI
 6eIIcKw95VuqPZMuNaf4WbswOJpKDsu+d4AZYNIncSY8WSroj6Lfl8wn94+Qz1wTPrIF
 BB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783043277; x=1783648077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DOn6vRfEsVTpudhzzAfawUs56a4yn/B/CVb7CXUItZw=;
 b=kjTWfAPgcQHXYWltWajsvBWr4xzZ27QvtYXvVUiutAG1b9yvABUChlyuySg2GIrO+f
 SQjbWJ2suF3ecKfotfYF9JYo4tuPH5EsJPiZ4ZdcyM2ytwWrLUwDoRuzWi8U3n2vKWCQ
 JhkjgKO9KVOfkI1BvNrcM5gyv3JTwCI3Jr//JQlNbIuTv+hr8saMY236uGmHysMVO5N0
 uDUB7iMyO5gX4mvEJgaYA5mf5ANoVLjJImgTlPo8IuKb4FGdq1P3Gu39IsN07194Us7U
 Pu1B1RQOzI4WrfG/qi80DVhYUYj0B7Jtk8RdmxBeCmAx55ULrHc/nJHxhk7cWit0mgMG
 9v6g==
X-Forwarded-Encrypted: i=1;
 AHgh+RqrMsEW7mvOC8jWTpEmQbr6wAerQA1oeEI1/j/LFkY0M1RE8AtK37N5q8L0hUvUoFG6HjxNQpNr4dZxHETQf24K@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzNm2gLpGT8FfHMAhEFle6B/UH0j0MjptAApxYhnfjP3TN6blQI
 8jlxtX8HNZxPtGkBOl0BDavDUvdd6a7wX7OZ9pHCIF1HqzVlrCntdnEqpR2pl60PgKzDYZwT7Xf
 l9hmjhWiIPLxddNRFlMkuAiYvpCxDaTM=
X-Gm-Gg: AfdE7cm7IV/Uy6YLISLt8QbfGJHOCmK9KyPEuUPV4h4J7I/qEzoEZtkH7+T5vKR59AZ
 /cefUOoTxYFmebxlg4XuRkhPaoOxfdttozIDQ6fai1gg8kEWeXi8ZA0aFLz+TrVZaB0vr2K4W9t
 hzqrdU6gvRKoeOt3lOFKwfF/lbK3LCfqwuvmMOWwIRG/U4wMaXHrRDTx7MxnLDLguiIcmjge683
 uTvBPrhpOgQ+iSTuyzazI4T0sjHRncSFRuhCEXgJEPJVeKgiZ7PIaG2DjAv6QaMW5bVJ2rDHraa
 hSZeIeHlUumNy8e64KXLh5tsd/xhDHvuF3+AF24x2R/u43IYSZID
X-Received: by 2002:a05:6000:188a:b0:474:88ef:cdec with SMTP id
 ffacd0b85a97d-479347abc89mr3414307f8f.6.1783043276701; Thu, 02 Jul 2026
 18:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
 <20260701000949.1666714-18-joannelkoong@gmail.com>
 <20260702140705.GE21339@lst.de>
 <20260702165117.GK9392@frogsfrogsfrogs>
In-Reply-To: <20260702165117.GK9392@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 2 Jul 2026 18:47:43 -0700
X-Gm-Features: AVVi8CdwjVgCnc8OibEiAJiLFqrCHykAhTtcw0AOMmm18cQj3dSCo5Q-SEBvMhY
Message-ID: <CAJnrk1b8j5WHtbHOWNXc4=QBFOxde1f2QxTOeui7Ta8O-xWcTA@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 2, 2026 at 9:51 AM Darrick J. Wong wrote: > >
 On Thu, Jul 02, 2026 at 04:07:05PM +0200, Christoph Hellwig wrote: > > Looks
 good: > > > > Reviewed-by: Christoph Hellwig > > > > In terms [...] 
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
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.221.41 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.41 listed in wl.mailspike.net]
X-Headers-End: 1wfT0h-0008QN-QB
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
 willy@infradead.org, Christoph Hellwig <hch@lst.de>,
 hsiangkao@linux.alibaba.com, Gao Xiang <xiang@kernel.org>,
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:ritesh.list@gmail.com,m:jack@suse.cz,m:mikulas@artax.karlin.mff.cuni.cz,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:hyc.lee@gmail.com,m:almaz.alexandrovich@paragon-software.com,m:clm@fb.com,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:guochunhai@vivo.com,m:djbw@kernel.org,m:naohiro.aota@wdc.com,m:zbestahu@gmail.com,m:miklos@szeredi.hu,m:yi.zhang@huawei.com,m:willy@infradead.org,m:hch@lst.de,m:hsiangkao@linux.alibaba.com,m:xiang@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:viro@zeniv.linux.org.uk,m:jefflexu@linux.alibaba.com,m:jaegeuk@kernel.org,m:agruenba@redhat.com,m:axboe@kernel.dk,m:fuse-devel@lists.linux.dev,m:brauner@kernel.org,m:jth@kernel.org,m:tytso@mit.edu,m:ntfs3@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:gfs2@lists.linux.dev,m:nv
 dimm@lists.linux.dev,m:lihongbo22@huawei.com,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,m:riteshlist@gmail.com,m:hyclee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[47];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[joannelkoong@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FREEMAIL_CC(0.00)[gmail.com,suse.cz,artax.karlin.mff.cuni.cz,sony.com,kernel.org,paragon-software.com,fb.com,dilger.ca,linux.ibm.com,linux.alibaba.com,vivo.com,wdc.com,szeredi.hu,huawei.com,infradead.org,lst.de,vger.kernel.org,suse.com,zeniv.linux.org.uk,redhat.com,kernel.dk,lists.linux.dev,mit.edu,lists.sourceforge.net,samsung.com,lists.ozlabs.org];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joannelkoong@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lst.de:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DB796FDCA2

T24gVGh1LCBKdWwgMiwgMjAyNiBhdCA5OjUx4oCvQU0gRGFycmljayBKLiBXb25nIDxkandvbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAwMiwgMjAyNiBhdCAwNDowNzowNVBN
ICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+IExvb2tzIGdvb2Q6Cj4gPgo+ID4g
UmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+ID4KPiA+IEluIHRl
cm1zIG9mIG1lcmdlIGxvZ2lzdGljcywgSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGRlbGF5IHRoaXMg
YW5kCj4gPiB0aGUgcHJldmlvdXMgcGF0Y2ggdG8gdGhlIG5leHQgbWVyZ2Ugd2luZG93IHNvIHRo
YXQgd2UgY2FuIG1pbmltaXplIHRoZQo+ID4gY3Jvc3Mtc3Vic3lzdGVtIG1lcmdlIHBhaW4gd2l0
aCBtb3JlIGZpbGUgc3lzdGVtIGlvbWFwIGNvbnZlcnNpb24uCj4gPiBJZiBub25lIG9mIHRoZW0g
YWN0dWFsbHkgaGFwcGVuIHVudGlsIHJjNiBvciBzbywgb3JpZiAgdGhlIG1lcmdlcyBhcmVuJ3QK
PiA+IHBhaW5mdWwgd2UgY291bGQgc3RpbGwgcGljayB0aGVtIHVwIGxhdGUgaW4gdGhlIG1lcmdl
IHdpbmRvdy4KPgo+IEknZCBzYXkgZXZlcnl0aGluZyBidXQgdGhpcyBwYXRjaCBzaG91bGQgZ28g
aW4gZHVyaW5nIHRoZSBtZXJnZSB3aW5kb3cKPiBmb3IgNy4zLCBhbG9uZyB3aXRoIGNsZWFyIGlu
c3RydWN0aW9ucyB0byBicmF1bmVyL3RvcnZhbGRzIHRvIGV4cGVjdAo+IHRoaXMgcGF0Y2ggdG8g
YXBwZWFyIHJpZ2h0IGJlZm9yZSA3LjMtcmMxIGdldHMgdGFnZ2VkLCB0byBjbGVhbiB1cCBhbGwK
PiB0aGUgb3RoZXIgY2hhbmdlcyB0aGF0IGNvbWUgaW4uCgpKdXN0IHRvIGNsYXJpZnksIGRpZCB5
b3UgbWVhbiB0aGlzIHBhdGNoIGFuZCB0aGUgcHJldmlvdXMgb25lPyBJZiBpJ20KaW50ZXJwcmV0
aW5nIENocmlzdG9waCdzIGNvbmNlcm4gY29ycmVjdGx5LCBJIHRoaW5rIGhlJ3Mgd29ycmllZCBh
Ym91dApvdGhlciBmaWxlc3lzdGVtcyBjb252ZXJ0aW5nIHRvIGlvbWFwIHVzaW5nIHRoZSAtPmlv
bWFwX2JlZ2luKCkgLwotPmlvbWFwX2VuZCgpIGZ1bmN0aW9ucyBzdGlsbD8gVGhhdCBzb3VuZHMg
bGlrZSBhIGdvb2QgcGxhbiB0byBtZSwgZm9yCnYzIEknbGwgc3VibWl0IGV2ZXJ5dGhpbmcgYnV0
IHRoaXMgcGF0Y2ggYW5kIHRoZSBsYXN0IG9uZSBhbmQgdGhlbgpzdWJtaXQgdGhlc2UgcGF0Y2hl
cyAoYW5kIGFueSBjbGVhbnVwIG9uZXMgdGhhdCBiZWNvbWUgbmVjZXNzYXJ5KSB0bwpDaHJpc3Rp
YW4gcmlnaHQgYmVmb3JlIDcuMy1yYzEgZ2V0cyB0YWdnZWQgKHdoaWNoIGFzIEkgdW5kZXJzdGFu
ZCBpdCwKaXMgd2hlbiB0aGUgbWVyZ2Ugd2luZG93IGlzIGFib3V0IHRvIGNsb3NlKS4KClRoYW5r
cywKSm9hbm5lCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
