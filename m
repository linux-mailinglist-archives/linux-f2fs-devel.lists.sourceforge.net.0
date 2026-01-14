Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCDFD20F3F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 20:02:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:References:In-Reply-To:Message-Id:To:Date:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3SbOOHN1D1bjCQdr99zyC0eo6c2GBGYi+ynRoRbpK8=; b=dte3NPjXekK7EO7Yeuhd1Mcown
	d1emnCZC5eTDgLHTYFuDArpp6vkq1f0u95AXTNEZ1ge92Ypd9IKoCNMzhVLnHtAFKvcJihl9bbVcE
	nLvsMwrGi/2t8SIU+KSWhCtNFIJcgZaprfWK/r50olMnBdRiXAWh22wq+Pxb7aeT7cYg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg67v-0005WY-Uq;
	Wed, 14 Jan 2026 19:01:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vg67u-0005WS-Uq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 19:01:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:
 References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e0VWjxpddlHUonSVBYh+nqzoJRb33mHYD/7rNFI2D3s=; b=QV0Q0MO/21/3lBxmwjc2C9peTX
 5n5QjHVOMW7p9M6iWbFSECCD8TPqKK0Vq+rZSC+v3Uknm+hKElvvOCodryHeCkjbYMCMPDU7Nt6IR
 VuRXSD6Pd0/HTMaGQza11hRizlFAR0OSgEJqCxuuTaMGSjrd/eoCb8PtXyakVvkXXdrg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
 Message-Id:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e0VWjxpddlHUonSVBYh+nqzoJRb33mHYD/7rNFI2D3s=; b=T/PFxP5FQOl2OfXs5LMGqB54N8
 qI0vYB6Gu/FYxBPwNoCZJZ+R4MlpFDkMcj2eblRJ75aW8+VvoDSvuNDIR56keQyrTXgh0p1qaj82O
 kXXk+PZpdU0JFvPSdojY5D8OKsUCFt6yk2xRrU6woOhLFu30QJFDwIPeJsKJW1NA5mH0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vg67u-00022Q-F4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 19:01:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E02954448D;
 Wed, 14 Jan 2026 19:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D634C4AF09;
 Wed, 14 Jan 2026 19:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768417303;
 bh=g3HtMKjfyATIBUdWx1OR9FO8cTMPuWSW1+k1E5kr5Ro=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=RmSzr7lhjh+SuI9fbDFJqw3m4IxQqe0Vaw/b4gJyKK720wWjau1KqfMxKznmVkrZF
 2N4O6Bc0hb3WeXj4ciDmf782K3DI5ihFjeykVR4v9aMYRWzgIvLCPlEU/VYFogjxxd
 TwYC1zhLfa6RMe5c0zdIa7aho1huL0kXcWrQilKkAodh38mBiyLoXi8jbO4A6/cYKq
 kb9KdmvOiYoOkyCHYk0p3k/a89l8lKnHoutJdPmPnYoP/vPV7lMSZwo9bj4hOplvIK
 3yCvPqJcuulNZMjplUve1lfq9qmXEN1Xfq94K31oj6Pp0Il2HBvbUSiGlGVM0IPhZy
 GckkrZ4BzTQlw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id 18121F40069;
 Wed, 14 Jan 2026 14:01:42 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-10.internal (MEProxy); Wed, 14 Jan 2026 14:01:42 -0500
X-ME-Sender: <xms:FehnaUaTdCeNbFj2CKINFlp9fPSNczpMhRHj7Olxm8fSeDvjCeuchg>
 <xme:FehnaaNsCt3HngjIzva8RqVGiR2aFvCG4ua1a4ChD9d6wRY_elyhnSAD9Bxz6nOsX
 hiVfoVAp2xsUW290HXq3DGZGHK9bEWtNGj4xg8AHTCkmQfG6UfCGo0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdefleeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfvehhuhgt
 khcunfgvvhgvrhdfuceotggvlheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
 hnpefhffekffeftdfgheeiveekudeuhfdvjedvfedvueduvdegleekgeetgfduhfefleen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegthhhutg
 hklhgvvhgvrhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeifeegleel
 leehledqfedvleekgeegvdefqdgtvghlpeepkhgvrhhnvghlrdhorhhgsehfrghsthhmrg
 hilhdrtghomhdpnhgspghrtghpthhtohepfedupdhmohguvgepshhmthhpohhuthdprhgt
 phhtthhopehsvghnohiihhgrthhskhihsegthhhrohhmihhumhdrohhrghdprhgtphhtth
 hopegrughilhhgvghrrdhkvghrnhgvlhesughilhhgvghrrdgtrgdprhgtphhtthhopehs
 lhgrvhgrseguuhgsvgihkhhordgtohhmpdhrtghpthhtoheprhhonhhnihgvshgrhhhlsg
 gvrhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhhirhgrsehimhgrphdrshhushgv
 rdguvgdprhgtphhtthhopegrnhhnrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsg
 hrrghunhgvrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptggvmheskhgvrhhnvghl
 rdhorhhgpdhrtghpthhtoheptghhrghosehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:FuhnaWW-M5daRxCF30M52eDLwDirM00lmSqE5Xc12ecFyTnNlLY56w>
 <xmx:FuhnafvkpwPyPR2KRXo5eKd8vRsR0YkZIXmsZrE6ry1YE33KuXSRkw>
 <xmx:Fuhnaa3oCsZSMQFQkIpOksUyk4s72_d3YiPbjNg3YdxOmFSZRimCGQ>
 <xmx:FuhnaeUABkFkasQSrfCIVLfMKlSjqShOkGxbIUShzGsCY5K1wb-Kog>
 <xmx:FuhnaYPaF8tb8lmdcQNpcC4_UvYC2VoD3Kzk5nif1Pt2r8jOSw-dObLv>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id DE8C8780070; Wed, 14 Jan 2026 14:01:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AOV0ZFhAWQu-
Date: Wed, 14 Jan 2026 14:01:14 -0500
To: "Jan Kara" <jack@suse.cz>
Message-Id: <7b6aa90f-79dc-443a-8e5f-3c9b88892271@app.fastmail.com>
In-Reply-To: <3kq2tbdcoxxw3y2gseg7vtnhnze5ee536fu4rnsn22yjrpsmb4@fpfueqqiji5q>
References: <20260114142900.3945054-1-cel@kernel.org>
 <20260114142900.3945054-2-cel@kernel.org>
 <3kq2tbdcoxxw3y2gseg7vtnhnze5ee536fu4rnsn22yjrpsmb4@fpfueqqiji5q>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 14, 2026, at 1:11 PM, Jan Kara wrote: > On Wed
 14-01-26 09:28:44,
 Chuck Lever wrote: >> From: Chuck Lever <chuck.lever@oracle.com>
 >> >> Enable upper layers such as NFSD to retrieve case s [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vg67u-00022Q-F4
Subject: Re: [f2fs-dev] [PATCH v4 01/16] fs: Add case sensitivity info to
 file_kattr
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <cel@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Carlos Maiolino <cem@kernel.org>, almaz.alexandrovich@paragon-software.com,
 adilger.kernel@dilger.ca, vira@imap.suse.de, linux-cifs@vger.kernel.org,
 Steve French <sfrench@samba.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Shyam Prasad N <sprasad@microsoft.com>, frank.li@vivo.com,
 linux-nfs@vger.kernel.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 glaubitz@physik.fu-berlin.de, Jaegeuk Kim <jaegeuk@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Christian Brauner <brauner@kernel.org>, Theodore Tso <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 Hans de Goede <hansg@kernel.org>, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On Wed, Jan 14, 2026, at 1:11 PM, Jan Kara wrote:
> On Wed 14-01-26 09:28:44, Chuck Lever wrote:
>> From: Chuck Lever <chuck.lever@oracle.com>
>> 
>> Enable upper layers such as NFSD to retrieve case sensitivity
>> information from file systems by adding case_insensitive and
>> case_nonpreserving boolean fields to struct file_kattr.
>> 
>> These fields default to false (POSIX semantics: case-sensitive and
>> case-preserving), allowing filesystems to set them only when
>> behavior differs from the default.
>> 
>> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> ...
>> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
>> index 66ca526cf786..07286d34b48b 100644
>> --- a/include/uapi/linux/fs.h
>> +++ b/include/uapi/linux/fs.h
>> @@ -229,10 +229,20 @@ struct file_attr {
>>  	__u32 fa_nextents;	/* nextents field value (get)   */
>>  	__u32 fa_projid;	/* project identifier (get/set) */
>>  	__u32 fa_cowextsize;	/* CoW extsize field value (get/set) */
>> +	/* VER1 additions: */
>> +	__u32 fa_case_behavior;	/* case sensitivity (get) */
>> +	__u32 fa_reserved;
>>  };
>>  
>>  #define FILE_ATTR_SIZE_VER0 24
>> -#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
>> +#define FILE_ATTR_SIZE_VER1 32
>> +#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
>> +
>> +/*
>> + * Case sensitivity flags for fa_case_behavior
>> + */
>> +#define FS_CASE_INSENSITIVE	0x00000001	/* case-insensitive lookups */
>> +#define FS_CASE_NONPRESERVING	0x00000002	/* case not preserved */
>
> This is a matter of taste so not sure what others think about it but
> file_attr already have fa_xflags field and there is already one flag which
> doesn't directly correspond to on-disk representation (FS_XFLAG_HASATTR) so
> we could also put the two new flags in there... I have hard time imagining
> fa_case_behavior would grow past the two flags you've introduced so u32
> seems a bit wasteful.

No problem. I'll wait for additional guidance on this.


-- 
Chuck Lever


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
