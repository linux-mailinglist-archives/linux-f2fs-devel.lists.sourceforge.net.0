Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85498C787D5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 11:23:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/UXKICC318HqQBOHNnK3bettNfJo0n4U51Gne6ICFk=; b=SGy+HRf7unfRZMAZtT5CQGAnLM
	9ZIpunyQw3EseKeZBHbD1X2+JYLEL4ER7S382OAAKWhMRMK5QlppKkePm4a/BVbEO6DUKKYXbvNLP
	9txY/XPm4v1pi5c1GuHISJ4wj3GLovhIhiEXdR8TfyR8yAeVUJujsmIRBv57SyfLehZI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMOIc-0004eG-GS;
	Fri, 21 Nov 2025 10:23:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vMOIb-0004e9-3v
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 10:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h5wlzZkf4qEVKsyUOVqttje88+YYrJP6tD0dXxLUF1w=; b=l9omiytNni26vWw7ui8HHSxg/d
 RYncGedYh1USoNsE4LrTPxsiqCJeab1eWLl5ProxY5vgqyA6BuPtLdaZuUeMO48CHzRkjyhmdUwwL
 0qYlNMArx0WLb1XvWcL7L7zjS/h6B30KH4sgCRmbrQrmX83wMY/Hal+U6vr1vPKres2o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h5wlzZkf4qEVKsyUOVqttje88+YYrJP6tD0dXxLUF1w=; b=hFdRoK1Ob9F6A2JnKFTXUqJuMf
 hXqp6c8PbzpzO1arwKvZiMRhXilud4YljIv7hhdtSyEy/Fup2yDsHJqDZ5RGX74SAbpUDnTO5hmNt
 J8avM0nZcAnwLWth8eoYqDIPMnEj/Tb6UWMQxRNl0r+BXtD54jr+C2t1N0YDbj/dAatQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMOIa-0007xD-9u for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 10:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D6452436F2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Nov 2025 10:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E83C4CEF1;
 Fri, 21 Nov 2025 10:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763720602;
 bh=htw0LBDETiJyiX2+ALuGnkgSCxegETSVFv+P/JA86ZI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gBK2zSHB5BpyKpiFk/H6hsxHvH/m77h9PKZAdF4zkyiT/kYt4tfv6/OwjJPGtr6em
 +qcO2tMg6zlvdB9ZMxNNPolXzM7z6fyvU8gVwv7kYEH3qLrtwQ2AZdSdAkl870Y77l
 J3OOmCPGAgDDcdEBar+ICz6+WL58yUzAkf3qwaM2fxaZmQU+6OOLjOT0yLWF7rXKQ2
 3isFuou1ZVUo+iGXLkugxH2/myLjQYM8WtrHgCJx1RTclDhiQWNVmSmyAOf3QnHMfL
 fbWNKLmAsk4RrqDWA++MJ2nQIM6w+TJ9DlA+iOkkr+EvJQIDVH6vnHhcOR3wGIqsg3
 NhsrwQcm/6+yg==
Message-ID: <db7ac308-dc34-4153-b44a-2b768b54cd4a@kernel.org>
Date: Fri, 21 Nov 2025 18:23:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20251120235446.1947532-1-jaegeuk@kernel.org>
 <20251120235446.1947532-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20251120235446.1947532-2-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/21/2025 7:54 AM,
 Jaegeuk Kim via Linux-f2fs-devel wrote:
 > For example, > > 1327.539878: f2fs_preload_pages_start: dev = (252,16),
 ino = 14, i_size = 4294967296 start: 0, end: 8191 > 1327.539878 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMOIa-0007xD-9u
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add a tracepoint to see large
 folio read submission
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/21/2025 7:54 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
> For example,
> 
> 1327.539878: f2fs_preload_pages_start: dev = (252,16), ino = 14, i_size = 4294967296 start: 0, end: 8191
> 1327.539878: page_cache_sync_ra: dev=252:16 ino=e index=0 req_count=8192 order=9 size=0 async_size=0 ra_pages=4096 mmap_miss=0 prev_pos=-1
> 1327.539879: page_cache_ra_order: dev=252:16 ino=e index=0 order=9 size=4096 async_size=2048 ra_pages=4096
> 1327.541895: f2fs_readpages: dev = (252,16), ino = 14, start = 0 nrpage = 4096
> 1327.541930: f2fs_lookup_extent_tree_start: dev = (252,16), ino = 14, pgofs = 0, type = Read
> 1327.541931: f2fs_lookup_read_extent_tree_end: dev = (252,16), ino = 14, pgofs = 0, read_ext_info(fofs: 0, len: 1048576, blk: 4221440)
> 1327.541931: f2fs_map_blocks: dev = (252,16), ino = 14, file offset = 0, start blkaddr = 0x406a00, len = 0x1000, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 0, err = 0
> 1327.541989: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 0, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.542012: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 512, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.542036: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 1024, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.542080: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 1536, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.542127: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 2048, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.542151: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 2560, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.542196: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 3072, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.542219: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 3584, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.542239: f2fs_submit_read_bio: dev = (252,16)/(252,16), rw = READ(R), DATA, sector = 33771520, size = 16777216
> 1327.542269: page_cache_sync_ra: dev=252:16 ino=e index=4096 req_count=8192 order=9 size=4096 async_size=2048 ra_pages=4096 mmap_miss=0 prev_pos=-1
> 1327.542289: page_cache_ra_order: dev=252:16 ino=e index=4096 order=9 size=4096 async_size=2048 ra_pages=4096
> 1327.544485: f2fs_readpages: dev = (252,16), ino = 14, start = 4096 nrpage = 4096
> 1327.544521: f2fs_lookup_extent_tree_start: dev = (252,16), ino = 14, pgofs = 4096, type = Read
> 1327.544521: f2fs_lookup_read_extent_tree_end: dev = (252,16), ino = 14, pgofs = 4096, read_ext_info(fofs: 0, len: 1048576, blk: 4221440)
> 1327.544522: f2fs_map_blocks: dev = (252,16), ino = 14, file offset = 4096, start blkaddr = 0x407a00, len = 0x1000, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 0, err = 0
> 1327.544550: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 4096, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.544575: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 4608, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.544601: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 5120, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.544647: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 5632, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.544692: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 6144, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.544734: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 6656, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.544777: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 7168, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.544805: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 7680, nr_pages = 512, dirty = 0, uptodate = 0
> 1327.544826: f2fs_submit_read_bio: dev = (252,16)/(252,16), rw = READ(R), DATA, sector = 33804288, size = 16777216
> 1327.544852: f2fs_preload_pages_end: dev = (252,16), ino = 14, i_size = 4294967296 start: 8192, end: 8191
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
