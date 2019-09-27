Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1BEC0C28
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Sep 2019 21:41:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZY+Df4Mha+8Ljl4wVIonkv3S/Bw9s2pccTWgpSKHsos=; b=fBZ7W1EUFHU6AnwnRnNTgEU1J
	ZvSoAphjYhTUdPquMDHEGtZZTWr1Q4dakR2F0x0RxSguV5HRD5P1I6wxyfORTHVnNgLVZE2/zxQBw
	Q3ETwa7EcLHeB2OPx68PlSMbJ0OGxazDMxIIr9re2gM6bR5oTYRkGOwnWyxRX/HKTi6hw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iDw7m-0003M0-Co; Fri, 27 Sep 2019 19:41:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@aol.com>) id 1iDw7l-0003Lu-Fc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 19:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8boG8ajnLNdx3Q6HR+50f0OISCdkUqomEEROs7B0REM=; b=Suoro9hkDUvBFoW5ei3QAw1QVF
 /xLUR/RNfCSNizE/hx/ecxK7yhqzdwtcLVKNnBkeK/nt8zJ2no39LpPXXdSfzqyrXnJkjirR9/Qeu
 NMfW1GvA22XQCzNlz1SdZV6p/sQRq30BB8T+G9x4VZcG5ImUV8TJLGLsdRCdW2NPqqsg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8boG8ajnLNdx3Q6HR+50f0OISCdkUqomEEROs7B0REM=; b=RRNpKppOkG9sPVjho3b5fobfaf
 nG6kBXPDf1+dTD2BNlzvrZ1Ge3U8KTPmVDfIfcA2i0OJsSQNoPu7kH3M/C55Tbpa1Ay5VvPiwLLC5
 D2snPhZ2K0A9z0omUlZEaVhzyzCWKapo8dxtwQybO8hZTS1qYBto6L42inD2W8LEMFtI=;
Received: from sonic312-24.consmr.mail.gq1.yahoo.com ([98.137.69.205])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iDw7j-008qLG-Cr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 19:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1569613305; bh=8boG8ajnLNdx3Q6HR+50f0OISCdkUqomEEROs7B0REM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
 b=aa/aYLW5CJzVha/YuFsyMwul9pI2Z+xqqzfebYBhWGxtSoDB6Ai9SqRQp1U/r70xYHIp4JWBe8H3k9zUhwCWzhBPPgjjVIQP/HDROXzENVW8I3oSwYOxvZ+2BJ0Hv2+uvhfcckJaHNu6un9+D72VwABJFTca18rJKXEsZJbHZI9vQnw3jLaCo2E4wuT7L9MAXY9lWS2BVj2SBfX1UcqXVNf7wCgdIvhxEMwx1hQm++fzoRfj1nMQQYqsPqxDckivLBR3VHzs7xVs0FWpZexACN3ycvOHTKPduUlHBAEqUnMhsUtPjoiU9zBwR3foHzgv/ETtO9PCPYlxE6sFBHvKKw==
X-YMail-OSG: pCHr9iEVM1k9TM9TPDlnLRCducPSmmLZBpQP9qeUg82P59k1NfAqLn34kyVSgrL
 y9VznNFoFpFn71aXdRBp_40WB.CiCBEIYPdDUU4flDq6eZrVkbhQjxH9RpsoXbNF4oW8uNgTk8K6
 KPUj297axzgIIn5hoGRz9e5u4Iazl0eV.itFbhTUX0V1MFYbeuWVfPo4br9lqNsdfCuTAxcFPYDy
 WyCstAMyLUGMVAmVQDW66kQEJHMSo1AVC7CMbPkxWpfXHH1r4pefu0AyfjThb3Yw8nEAzjVBLpBh
 bMYY9AcQWuZTMeHqAkKPWSt0TL4.UZIqIQxoc5svVA55AhNHuFcU14wJ5zxiBwppH_X9DBFP2Rkn
 QKElhCWvmQ0_D097JIpdKIxXqpKa43.aWAUTIWVmij4ZxR9ZJhy8hbOoPFaJpqaVAbyWvpbDwFVm
 62Vpm9aTZipxDFwNnEovTfyP09ZaulGTvcrgV9Yodrlm9Jp80MwYrs7i.OwV2WVbbLNWsS0.EcY7
 t65KmSSmdz0SGL0W5lUsuMjckRejcChAB.OFH1LlfpFAR1WldmZVl5nl0xUNPrQyjsh.VsHIJ4FB
 z62mjmNnbeQKVw_bdxMUvGeAKG7UIbcqRnSDqyJztYs6y.xU3JXwqVV1RcE3kdStKuO6n2_JhBmZ
 NrYqokMH6DHhQQmWRmEngjngzW1qUBQma.n5O6fQ5KTGZqoF7mjs8fT7ut0FhyCOA7q_Qy4V_dcE
 tOquODj96YyvHxgEKFN7.yghXNgpePYl5sPfmBtsZhPwv_4q.7.79DAwNG3xvQQD6J08Z6ksrf6b
 5Bpw5yhYC6x5o4QNtBqDjED4g4dV5UDyUFOA.85u3ohyVsdWWB8XbPRtp_n9YjFPv5333lJ1A602
 MGGlRXrgRG9x9N7ec4KE_Xiq67lxg0xM47adrMMHxq8rZP_iIHj9CvBJk.fEj.pZBEHpjtvKLFr0
 24hx7UBT0jvES4wFIBEpoYnsFGSTqexwbQhzzvV.UP3Dlr1fdoxc_JcTt58el3Y0HYRm4DtD.bGi
 xevgj4XkAuFt9Kh3tmys.ERqE.4IikUYVMrVLJruVNmpAIVD0kGigPgMtoxXAvXKnhVpY8yqiSAo
 _WREP_t0sRa9aWjF1R1t3Bc_97nndNkLAf8VMRFwYcjjyFkNSyYEAUDwjGzwYoVtAQSt.XI8c_Wg
 vfBquSiJtV2uScilya0toff9qisQEU2loe.L6lMv0XgnZiH1uzQGNUAev7Y7ZJV5I4dC8t5JWHBG
 3Hmecs27pGGvLrVemAJQhn3eTaKpodm3_2jmXFq60dju4hwbnyjHXdsXb
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Fri, 27 Sep 2019 19:41:45 +0000
Received: by smtp413.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 41ea480fdb5c16ffe76a1010a62f6533; 
 Fri, 27 Sep 2019 19:01:14 +0000 (UTC)
Date: Sat, 28 Sep 2019 03:01:10 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20190927190106.GA27964@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20190925093050.118921-1-yuchao0@huawei.com>
 <20190927183150.GA54001@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927183150.GA54001@jaegeuk-macbookpro.roam.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]aol.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [98.137.69.205 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [98.137.69.205 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iDw7j-008qLG-Cr
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix comment of f2fs_evict_inode
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

On Fri, Sep 27, 2019 at 11:31:50AM -0700, Jaegeuk Kim wrote:
> Hi Chao,
> 
> On 09/25, Chao Yu wrote:
> > evict() should be called once i_count is zero, rather than i_nlinke
> > is zero.
> > 
> > Reported-by: Gao Xiang <gaoxiang25@huawei.com>
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > ---
> >  fs/f2fs/inode.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index db4fec30c30d..8262f4a483d3 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -632,7 +632,7 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
> >  }
> >  
> >  /*
> > - * Called at the last iput() if i_nlink is zero
> 
> I don't think this comment is wrong. You may be able to add on top of this.

Actually I don't really care what this line means, but someone really
told me that .evict_inode() is called on inode is finally removed
because he saw this line.

In practice, I have no idea what the above line (especially the word i_nlink
== 0) mainly emphasizes, just from some documentation (not even refer some code):

Documentation/filesystems/porting.rst
326 **mandatory**
327 
328 ->clear_inode() and ->delete_inode() are gone; ->evict_inode() should
329 be used instead.  It gets called whenever the inode is evicted, whether it has
330 remaining links or not. 

And it seems it's the same comment exists in ext2/ext4. But yes, it's up
to you. However, it misleaded someone and I had to explain more about this.

Thanks,
Gao Xiang

> 
> > + * Called at the last iput() if i_count is zero
> >   */
> >  void f2fs_evict_inode(struct inode *inode)
> >  {
> > -- 
> > 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
