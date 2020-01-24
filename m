Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0441477D9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2020 06:04:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ObqHxY2zYLObeE0FeFENa/19DWyWfKFqIei1AT1IuRE=; b=UHBufNCp4Eq80W+VHaYcNTh+t
	6bFrQrSP7mdgwuX+TeWu6XOJRyOJXVjs/wo4YJ5ZsOTgqK4SHHyu0JcTPq9/vPZBEoVNTU4Q1MmQU
	2r+GDgCSqIBuHOQWwCmU+UpD+00skg/UormOFWqzvLecds69T3WspRRpQ4tft5Ji09oeE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iur9C-0006mb-M1; Fri, 24 Jan 2020 05:04:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@aol.com>) id 1iur9B-0006mU-PB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 05:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KxVB/E86lNKNhPTU2/RM2/D0ts46IDAvVmg873JVtI4=; b=Mlw1s126CUs167vrkgXYICMse0
 xZ/ozGcTIsrkcSr29XXLzhXhnJiIJrR/k5D7G/Jgha4LEUz9Nd5EZtY8DViiHY9J4VGD5TsOnO8Ae
 Yd/7ojal5VvtsTFDEunjRVUf5TjempgX9o1Tkr8Gh+a+vQaTgEZQ35gtQh95hCq2cO3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KxVB/E86lNKNhPTU2/RM2/D0ts46IDAvVmg873JVtI4=; b=GsGWt7A1DO3LeuVwF0rso1XJuy
 JEwF4Vr6sALn4939eGlaaiCVhpYQdJblgKaa6CsO6qWH+RRC7nYBIo+YQZe92yulpr8u/5cq9WjMO
 iwTAUblesnmlTCnXzJQmjiWNCk1mSl4nolnZ1vRa24BPDwP/HrqRbL8C5WHUO9K5qlCM=;
Received: from sonic310-22.consmr.mail.gq1.yahoo.com ([98.137.69.148])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iur9A-003H0O-C7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 05:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1579842276; bh=KxVB/E86lNKNhPTU2/RM2/D0ts46IDAvVmg873JVtI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
 b=J9TObx8dEXgW7r+jATz5Yr4s7+z500v0s+p0CDTHFKdA73WjMIZOruK/shez9tLr/hBvzVDz+u0TKwhVf6JsJEGeS5ouRptFVF5KulTctzepq8K/DETAQm3BW/QhsGKWaqVHYcCLt+P5ZwSRbwxocDkZZ/m6oi72esrjpsFmBxOD4uqMhw9W3zIpUhPUPi/XSFxnBs0IZ/gbSVCHvIVOsy2TvW1ZwulXz/KSrM9U9VYWjLNEDff+qTlx/IB9vV/lC/iJG5Ux52oujcahCs7QXESkAKi0sSru/TUPxj4SH3utCNX7RP6anjdPvgFKibVt/YH6loZQXPVLGMDzvUlXXw==
X-YMail-OSG: Uc6NeP0VM1nmfwyyfJft38JRGlFtmVIVadugRNgCQQPlasdldofbxmv9XY2SRRv
 c2XF9DV4wrM.lSl37DCJxJwA1ZN1_PbrZtOBJ5MayiXI9WNdNe.L1yGEg1MKDMwwTkDPTrkTd3pp
 5eqh56aDCNt179q4wX85kLpW4xjtpZ1SMtNKHouolgA9cuXn1v38WKfJjLsma9GdxFwgpJ3.1dYn
 Qk_uSCEHt7tnNIp33CXea3xOLhkJWPUwgSvaK2oaPHwQGRjSYigyzwG8KIn0EpBOVYONWHM404iQ
 SWDRrn292EKpMLFmxrAiE3bmy0j0aUHt2BFDfr5a_ncZnAPf5.5RFc3NVlpBeIF.E3NLHbNggfVk
 Er_gw2QUtgyTFMcGUFKHJ2DAcZC5cbWNuvYgrwRxotUGXGAXinwRvvTlGwjc48qj5eY1q.dn4nyl
 COt_c_kB07JsC7dkQkym.GCzUgCswzVPM5X.jn0iv2cpR5PAf2yMwIgnkEolm4PxaUVs4kcE2D7v
 EI2UB6XQoL_zIIww242AooZQNqhzYOokrZZmyAOSF2YPcVzNFRsTEPIfbSslre_gSBaZz.JeMi.d
 oJy3Tv3j6BJYDLxuecH3iWuFVOYTbYeud3hCHm_MxquPLevVAr_B_WIoanZ6C7WtAtRuCOTygDR5
 jD2WFZbXv5xHy1pevldBj9R6eTQefam9xzuqaNTnAwrtjdR4FjtJnczb2lJnEXQNJH1TKNTMouDU
 DneHw3RhQT73gIcK8jGxBC_EoG31Fx9q8ORa4G8PSu62GvuWhsyt7.WZTly1CZCo.kDN6zq2weLm
 vjxw74U73JRTFVb0bWi2TMxWSJWP.dcyXaGyAmQ3jmd5_Tf8lDgOK3jf6iESV4T62w2VrP6xR2cO
 9FN3aWwDMTu__52XTnQFlwZac2G00._Rx3JzWuQ8BTthW.Crl8RWFyfnm2bhk.ZfEjBLDQ3tv4Mz
 pmE7Lx61eSR46OzfqBD7INCLnP9g5HNHTug8vpXuCxza359Nk5t5Z7_ODqvCN_gyiRCvqAGsjPgR
 eC23JS3CpGagk7tcXhv4lOySQBng48w7csOecCr5EAK8djklj0crKAz9NbZgGS55q47ZSbEEh5uV
 ulqtzrz0mmPl0fJux3.ApAVOwpUu03rINtyqr4R7fe7fVBGE5aSa_tx7aLb2qBzuXFSvMie2qyxA
 MFvQhSzAhTGN0_akTcpm6KuGZbqGt4OURebaUVffRFXoERRSOFQJQIOuPZW2XA3ELlagAy_qZkH1
 zWyDpETlchCSf0DUl_hpU5nD9o6rrY03LZfDqCF1G8C1l0RUgpxvp.4CQ1mUoOFDL93oXSkbjnwS
 DeOnHjBHxAkGJfexW8YD0mWiDo5y7ihu24KoLaBmD3bdD6PuP2mnYu9Y96Z_idwkl3IHLO2QpWku
 U8MKFwC7nHgeBhYJQwAqetIjP_3Zb7pql9YY1
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Fri, 24 Jan 2020 05:04:36 +0000
Received: by smtp405.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID da8cd968291b387cfb3bcafe1576746f; 
 Fri, 24 Jan 2020 05:04:32 +0000 (UTC)
Date: Fri, 24 Jan 2020 13:04:25 +0800
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200124050423.GA31271@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20200124041234.159740-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124041234.159740-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailer: WebService/1.1.14873 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_181)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [98.137.69.148 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]aol.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iur9A-003H0O-C7
Subject: Re: [f2fs-dev] [PATCH] ext4: fix race conditions in ->d_compare()
 and ->d_hash()
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
Cc: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

On Thu, Jan 23, 2020 at 08:12:34PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Since ->d_compare() and ->d_hash() can be called in RCU-walk mode,
> ->d_parent and ->d_inode can be concurrently modified, and in
> particular, ->d_inode may be changed to NULL.  For ext4_d_hash() this
> resulted in a reproducible NULL dereference if a lookup is done in a
> directory being deleted, e.g. with:
> 
> 	int main()
> 	{
> 		if (fork()) {
> 			for (;;) {
> 				mkdir("subdir", 0700);
> 				rmdir("subdir");
> 			}
> 		} else {
> 			for (;;)
> 				access("subdir/file", 0);
> 		}
> 	}
> 
> ... or by running the 't_encrypted_d_revalidate' program from xfstests.
> Both repros work in any directory on a filesystem with the encoding
> feature, even if the directory doesn't actually have the casefold flag.
> 
> I couldn't reproduce a crash in ext4_d_compare(), but it appears that a
> similar crash is possible there.
> 
> Fix these bugs by reading ->d_parent and ->d_inode using READ_ONCE() and
> falling back to the case sensitive behavior if the inode is NULL.
> 
> Reported-by: Al Viro <viro@zeniv.linux.org.uk>
> Fixes: b886ee3e778e ("ext4: Support case-insensitive file name lookups")
> Cc: <stable@vger.kernel.org> # v5.2+
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/ext4/dir.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
> index 8964778aabefb..0129d14629881 100644
> --- a/fs/ext4/dir.c
> +++ b/fs/ext4/dir.c
> @@ -671,9 +671,11 @@ static int ext4_d_compare(const struct dentry *dentry, unsigned int len,
>  			  const char *str, const struct qstr *name)
>  {
>  	struct qstr qstr = {.name = str, .len = len };
> -	struct inode *inode = dentry->d_parent->d_inode;
> +	const struct dentry *parent = READ_ONCE(dentry->d_parent);

I'm not sure if we really need READ_ONCE d_parent here (p.s. d_parent
won't be NULL anyway), and d_seq will guard all its validity. If I'm
wrong, correct me kindly...

Otherwise, it looks good to me...
Reviewed-by: Gao Xiang <gaoxiang25@huawei.com>

Thanks,
Gao Xiang


> +	const struct inode *inode = READ_ONCE(parent->d_inode);
>  
> -	if (!IS_CASEFOLDED(inode) || !EXT4_SB(inode->i_sb)->s_encoding) {
> +	if (!inode || !IS_CASEFOLDED(inode) ||
> +	    !EXT4_SB(inode->i_sb)->s_encoding) {
>  		if (len != name->len)
>  			return -1;
>  		return memcmp(str, name->name, len);
> @@ -686,10 +688,11 @@ static int ext4_d_hash(const struct dentry *dentry, struct qstr *str)
>  {
>  	const struct ext4_sb_info *sbi = EXT4_SB(dentry->d_sb);
>  	const struct unicode_map *um = sbi->s_encoding;
> +	const struct inode *inode = READ_ONCE(dentry->d_inode);
>  	unsigned char *norm;
>  	int len, ret = 0;
>  
> -	if (!IS_CASEFOLDED(dentry->d_inode) || !um)
> +	if (!inode || !IS_CASEFOLDED(inode) || !um)
>  		return 0;
>  
>  	norm = kmalloc(PATH_MAX, GFP_ATOMIC);
> -- 
> 2.25.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
