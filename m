Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10670147835
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2020 06:38:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y8o9KkhbQgk6ZjleU7UbZDA5GJeurFYT1XjHuvR3x20=; b=QcWbUKrmjmnDiqJIgLbgRnsTl
	hQ9cOoQRbynohYJzDQ+0n56JCPM+0XsFuDJrlNQMqDgO/d7fGi872EN2yOk+XmT+/NZ0dGIookZOg
	ywqsvSBzj/Wr0L4sw+CfmB6NRXK6xuGfXpbJ72Hl81d1sLFhsCFjhnRClNrjjqLSgM2xc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iurfa-00014Z-RS; Fri, 24 Jan 2020 05:38:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@aol.com>) id 1iurfZ-00014I-Dt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 05:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9necSZIJYyRRJ8jaU0pxv6QHcZkJLNsfLRyto+nrVh0=; b=jsS50TiYjhy9XQEHMhnU8Fb3dZ
 +qjvqaHYDIlIcZzpnJiw0g5f5jWg0qkYouPvGky9SXJA4MvPWsqutEkWWn+fTgRg7oXbfKpUsydEE
 /xH2UfcVXLwTwrBppaEiNqtQ/717Ufcs29TP0TuNYVwyhjjHMknFZaoSZHiQ17dFcRdM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9necSZIJYyRRJ8jaU0pxv6QHcZkJLNsfLRyto+nrVh0=; b=TWDF3zSJl/aqJf8KZ8BPgmnEji
 gthM1e51ocm23LJZCB2002Q28G3+4d3ufNVOADScIMYU9xVHA7YOEigDnHdbqgclTNl9lvkLWZs7Y
 Wz3sqNm9WusoKg5uhEinJSwzyRYFEXfz4Pd0ssiu9yjArmxmECeJiXN34+h7VWwZCCmw=;
Received: from sonic316-8.consmr.mail.gq1.yahoo.com ([98.137.69.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iurfV-003Iqk-Fh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 05:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1579844283; bh=9necSZIJYyRRJ8jaU0pxv6QHcZkJLNsfLRyto+nrVh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
 b=HBWJCEQBK/ypchGf91p29qcl4eIaf6e4+80RFoMAqqV+US/LtqOZFxUHFWFYfBX7qwMpj+FYzLBlI5gU+5CjVOnU50wrmyA3VA+nvRR6evWsuBAE/rYNP5WJG1insD0rsmHAjG3Jm8D01+WLvb4j5h8Sk0iN3YQGFXPF2XWpQtsc6BXNUKrSWIMyMUP/AzGHAOavB8F+OhJEww5WN6eqtYXWpvg4eaAmz8iKRJr34oSVWe9WOEyY7ecxvxRUwFXr5DW5iMnGn0+KnQrPDuiMSwogdNmNHanMbuDJHYQGuIZJK0wMt12Ic6lHMAQw3F2bDURnE29ZC9gcNdkVvEuQ8w==
X-YMail-OSG: qwkSMKYVM1nerF17bL_ncoKZ2f_7EvelyTnyy3.ARwKl_O4amY4btNkvurM6GkS
 tz_M1Jj66QgrapfINFE7UFlEbiLNWpxMMC0irIKqVtR4VgNCfNvkd2GitLYcrbCEmRe__rz9aEDG
 ZfHMAOJOxx8fZ6DX9H0vybNj_il3xFVv7olWcc976yMVozTOQdrl9J8EmFPPy4uUXGR8aJNwQjbP
 U0jJFJDZItheE38vAa3kAOdwUJzSRNztxYZIVgkvclBGwRBEHp_2tN7swPgkkgpcM1RHu7Ar0nM1
 zCyuJZxodiGH0E6xnDscrLD5EybnjK5gxz_mv8_Dc_gtUlE6.IhtxeaDuoD.lVe_7enHdDvyZpVA
 Fm6oZEn7vQTuCO8pj9Zd1rM7wU5BVpa7v0iDmjHZxOVvrnhXwrMWqkyZJurCYT5IZG_Pwg.u8tkx
 1SIUkcsDBLAI0u8Jj03SLeMwfB.cfPkxTUKOS8rrzMl.iVDp2HFup9VnvedaUEqwUaGqyIImdzm3
 9YQvtEyumMbr7Hg.gHWnwE67kU7wpQm9nbxIE_l.CjFarf4wu12imoWhbtFQpj2ltbeLIK7qu3Fd
 6yOudhzS1S3pavDFunOHu9UXRtoXrKEglCQhA3YR1NAVrHmOr8CzPHPMxd3DWdzy7S3gRnDpG_AX
 gk2c3R.D54fyXcrsNuWRsGpAL1aa1VGy77HIT1mAfFY0MSeqv1B5eTq7EJFWUSIMTD7tOgh4vBDK
 BNZ1oD5enzzGfKh_1JjuDf69PFMWYbH.QfVWY61YOWdBzSS0uaLHBOXbwzW5rV1XkQKi4j1zmX.l
 10Fk3AeDnoQaWx5Moqv18Oz1Tc..AEiBaD9aTGQfVX7YUyi7jHRovnVy8mAD2F4bQKE5.3nAx427
 uF3LPxI_gkd8LkauPvDyh7HD7SmoZtTubyPxMtgueBIA4YNqGDL8J6IFOMdlNO7jE1WcKDTLE63W
 Uy16LO2Vogu2th1yjnnGpaAhHbjMySKUq3u0u4.HNtd5cg0OuHjjFe0E5YgVM3tI825GTG5bsVOm
 A2H1FYmGq3JdexnGbqGnTfdPOZi4h6DPLHT3Fvxg46yJvXW193JJf69qKG2KdnjnVPYe3396Y13D
 FW6pqj9hNUKu6w_oGAPTBVbEYT2yNXr4.wg1PnYpFHUPDKarAClWCOAmxzlwTCOLK0GuNiWK9ItM
 nNzEWorDfEZi_7RGLuUbFWKb2DKSEaYMBJhg4wqyaK8Ii1GeCkOqWePBwMZieIyKILpHQX3GegwY
 5fPch8JKIXEepoGK7Ud4WkupjyMgzkE8Pe3XRIuVL3slJZMH8RR9urgW831I17RP2Xyx0gBSALJS
 bfVsd3XrV2xpw4O5RqUj16Y76vzS3DemXYXClYZ5yRxjlpIHmk7ctla4tZwODvVmAy.dJKizhsV1
 SdNFR_yBYcwpZQ3UEzU3kojQlAqDMgkk1Ag--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Fri, 24 Jan 2020 05:38:03 +0000
Received: by smtp428.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID f9b7953f40d5a7531fce28ad55186da6; 
 Fri, 24 Jan 2020 05:27:55 +0000 (UTC)
Date: Fri, 24 Jan 2020 13:27:50 +0800
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200124052740.GB31271@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20200124041234.159740-1-ebiggers@kernel.org>
 <20200124050423.GA31271@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200124051601.GB832@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124051601.GB832@sol.localdomain>
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]aol.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [98.137.69.32 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iurfV-003Iqk-Fh
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

On Thu, Jan 23, 2020 at 09:16:01PM -0800, Eric Biggers wrote:
> On Fri, Jan 24, 2020 at 01:04:25PM +0800, Gao Xiang wrote:
> > > diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
> > > index 8964778aabefb..0129d14629881 100644
> > > --- a/fs/ext4/dir.c
> > > +++ b/fs/ext4/dir.c
> > > @@ -671,9 +671,11 @@ static int ext4_d_compare(const struct dentry *dentry, unsigned int len,
> > >  			  const char *str, const struct qstr *name)
> > >  {
> > >  	struct qstr qstr = {.name = str, .len = len };
> > > -	struct inode *inode = dentry->d_parent->d_inode;
> > > +	const struct dentry *parent = READ_ONCE(dentry->d_parent);
> > 
> > I'm not sure if we really need READ_ONCE d_parent here (p.s. d_parent
> > won't be NULL anyway), and d_seq will guard all its validity. If I'm
> > wrong, correct me kindly...
> > 
> > Otherwise, it looks good to me...
> > Reviewed-by: Gao Xiang <gaoxiang25@huawei.com>
> > 
> 
> While d_parent can't be set to NULL, it can still be changed concurrently.
> So we need READ_ONCE() to ensure that a consistent value is used.

If I understand correctly, unlazy RCU->ref-walk will be guarded by
seqlock, and for ref-walk we have d_lock (and even parent lock)
in relative paths. So I prematurely think no race of renaming or
unlinking evenually.

I'm curious about that if experts could correct me about this.

Thanks,
Gao Xiang

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
