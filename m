Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBFB11ADFA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2019 15:41:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HBiqgRExdgcR85kjCtFHvyd/ybIgfoYeWn7F8hhh+eU=; b=GA6B6h6h+Ay5Z31CYwrv0umW1
	gSN81XFPUppdIo0/4Tx48dGrN9mr3Fr1STMx2RzJMLxSjPNrmOADkiX3b4nELoI9RO9WixXZLYIp+
	98GE96tSwIdxuqHObtu9orcYPQ5QUGz7z7K4TuF2I6VUDm4I/9tialh3VsIKN9JKPSJ7c=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1if3BF-0003f4-8i; Wed, 11 Dec 2019 14:41:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@aol.com>) id 1if3BD-0003ew-L5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 14:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8NXnEgzl9Hn8ih6NVxBSO6w7sunPtWemBcwEu/MIQmY=; b=abJGbIQKQCeURwVXek3G+opl00
 pNXtVT6SDy1LZb99u6Lw0hSmrVx/YcLDUrBPZPWieE4lkrGlij4aObW52o9FvI48+sP5rgFajcf+q
 S8Pi8g3CqJySQDmxW3apEGSZTwj5NfqlB9w8+vvDj8fKXEZNIPqx1XlQMd54RYV5G/JE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8NXnEgzl9Hn8ih6NVxBSO6w7sunPtWemBcwEu/MIQmY=; b=HcRh1Ob5QeP2g6/xKcY/wmJdnN
 sO3zZbsXZt/Z9PUyd+c6TIorrXOtpxH/9mNmuuaKnfsK18070Jg6+hEG5CahYI6EgxIQ5wXIVApzL
 K87bTzDIBLAG4GkrJ1pT0lfuMgT4kMbAsQzkLSh26NHA1Rl6wC/rC+8/eOojhS+B9YAA=;
Received: from sonic316-54.consmr.mail.gq1.yahoo.com ([98.137.69.30])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1if3BB-0010St-Im
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 14:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1576075283; bh=8NXnEgzl9Hn8ih6NVxBSO6w7sunPtWemBcwEu/MIQmY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
 b=fsjcTIV9H5UBmlvgJKstt4aT/VgsSf7yCPzptrD0iuurqBijQPf9SpJnVFK30s2Ycx6WiiJ5vWb5xaNBaudYrK5FVORUy9y1N6Lq4pbRgfipFlGZLv6/tinLBRT9cWbuOkykanIr1jciUbo0mLN5d3UnwaJH6qCatvgK3tFU7AEnUxbBXXFBKdCLSGYVK6KAEJbeQPjSDOKv9Bb3ieEF/UcWl9axO8JI8thuE5nKudgH5053ddxAM2nDZvmSdNqK0B2hE24QgdCm8yASCFVItBXYHNvoPk8ssysD75q/fd6xZm10G0UVccXuCqvnk1TCLDHhSg3msuFeLNd5TBz2tw==
X-YMail-OSG: 7tLwCK8VM1kVE8ixC98XdwHbsJrsuowK0Ze0yHbgVvZa6ezhc58f6EXGiUYOjUo
 AvgARQgxWpqLV1OAf3D2fl_5DMhgK5Ev.ttEquU_oV7eCokz3DaqY_Qu0WCyuDhhoe.VlXjSIVbm
 5Y.5F2zhwxrWQo4nSq.f8HjwY_c7hRA_OOQ6ywzIT2B34zsJV6Ny9_d_KT_8ehqqkOkTnpdHxzeG
 GhGH8.QNcUaeNNP5J9yLC.nY1Ym1QvatVSdIhcqSA0cH7GLgnEFJ5I1lpKFoUlwJZxW5rpJxnOf0
 Upd9ZV1x5J4_Z7qOWQmE2QxMeQ3btI30By5jXTN61_bO5aQylvOx_Zs04VOX8Y89ZJ2It0hCO0S9
 n6iJlfoV7.owVYOlxTY1f69F9W91EVTG0r8jqAFjS7InWJzhffiRfuEjAoS5X1l2vVTXMY7gA3w.
 96SADI16lGU1I44jwY8D1XSZl6Jcy5i4gbpQg5kqhIoVfYVYo5pKgvfaLAE.kap5lEj.QvPy8buq
 YrN5hJzFd.IHzCnLMyldBirgqcHDFFgxut1v_Yub8z1eTN1U6jqqNOxSSSiqq2_3WD3.373SyRMA
 Wt5.ik0DP_r90uwwT5kxRyaJfDYRW1Oc8PDtrHWb61hTLUQHtd4RfNSJck9nIpiiMOJJJxSUTNOg
 GPoBIBZ1TlrZoLsYo.Ga_cuvHij58M9LD7yHcl48t_vfQUV6lHKXsjvlUJdl_WVsDDwJzSGILYPm
 sYxKRG4sJBSmxioh1u6VlKMRU4Qa5Y6nVx.9i51cjRtrDeD3a673qQVRb2i7OVtHbFgmsU84B_Vd
 7yqO3rtnmsGO45TPuMMTOrdQNBVQB.H62evznpNyGJgpr5btZicu4VYFtWFySdrSPrQ2sZmBFPPX
 txqmSEGEm8GyzRCsSMWyvset0sc50Kc3SOTFcsAwtlinDM55dJjAd3Sht3mAF49ttU27GypPpFUP
 6SzBMznAm6FS6EUxwy4PlXc1HPvF6HkXiffyCsthLUMy0WHG48OYxXeAgl2H1G.d5tqyYbwsNn7W
 FjS9MKf12dXY8FzTo32qAK_0Ng8M9GXVUdvsdb0I7pECxp5aCvEsVbt7FItG4HMBS8ztJPYZ54bE
 p2uwf.B1hmfnt87hZfIkVw3r4m8OXYszcbUqsHX3WhM.BrghCdqycqzRu8O8jJu2fsuSdFx_hWV6
 MMhCq72YiZxrk5xuN7XJeo.18JqmD0l66geIQWB38WxgtbOTN1xfgchBgzW.Bh_QC5Bqlgs.OBQr
 Ia_BVgCLitKrmkzLIiz9p4trv8BhmG2JQ7291iwAdXwRoFB5MgE4ohNYRsGpcSDDE8hgmWkQJqvB
 6_qUOovThV5EDGgwha5sBn8uY9VkIK.irycx0ed_u0gv7ilE_lZPAm9v8iexz5HMXgN4B3vwhHSW
 E
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Wed, 11 Dec 2019 14:41:23 +0000
Received: by smtp417.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 36f5534268c63ff9379ab7e119e12b1f; 
 Wed, 11 Dec 2019 14:41:18 +0000 (UTC)
Date: Wed, 11 Dec 2019 22:41:00 +0800
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20191211144055.GA6951@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <1576030801-8609-1-git-send-email-yangtiezhu@loongson.cn>
 <20191211024858.GB732@sol.localdomain>
 <febbd7eb-5e53-6e7c-582d-5b224e441e37@loongson.cn>
 <20191211044723.GC4203@ZenIV.linux.org.uk>
 <4a90aaa9-18c8-f0a7-19e4-1c5bd5915a28@loongson.cn>
 <20191211071711.GA231266@architecture4>
 <20191211134014.GM32169@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211134014.GM32169@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailer: WebService/1.1.14728 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_181)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]aol.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [98.137.69.30 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1if3BB-0010St-Im
Subject: Re: [f2fs-dev] [PATCH v5] fs: introduce is_dot_or_dotdot helper for
 cleanup
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
From: Gao Xiang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Gao Xiang <hsiangkao@aol.com>
Cc: ecryptfs@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Tiezhu Yang <yangtiezhu@loongson.cn>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Matthew,

On Wed, Dec 11, 2019 at 05:40:14AM -0800, Matthew Wilcox wrote:
> On Wed, Dec 11, 2019 at 03:17:11PM +0800, Gao Xiang wrote:
> > > static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
> > > {
> > >         if (len >= 1 && unlikely(name[0] == '.')) {
> > 
> > 
> > And I suggest drop "unlikely" here since files start with prefix
> > '.' (plus specical ".", "..") are not as uncommon as you expected...
> 
> They absolutely are uncommon.  Even if you just consider
> /home/willy/kernel/linux/.git/config, only one of those six path elements
> starts with a '.'.

Okay, I think it depends on userdata and access patterns.
I admit I have no statistics on all those callers.

Just considering introducing an inline helper for cleanup, except for
lookup_one_len_common() (since it's on an error path), others were all
without unlikely() before.

Ignore my words if it seems unreasonable or unlikely() is an improvement
in this patch and sorry for annoying.

Thanks,
Gao Xiang



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
