Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1853B4FFD28
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Apr 2022 19:54:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nehBs-0005UU-KA; Wed, 13 Apr 2022 17:54:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1nehBr-0005UE-Cy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 17:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wo/jbDl2Y1287Vv2vMz4/0xE7T8FPBwlfmFXkoDZcCg=; b=YNL1VeJeNdVh9fwSQSwgkhZv7o
 7FiBAnjKtPODEBTYtCSxSx8qbaKTYwx3c7CZxz3n4Yy649U+DEZNbuBV4DN8CI9EmyuFq0VTQd4iL
 q6UO0eCaFdd6Yx1QuUXFPZ40XLJFIxyP8KoLqKums2330PAPxLHNiGLNuQPwtu7gRAyg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wo/jbDl2Y1287Vv2vMz4/0xE7T8FPBwlfmFXkoDZcCg=; b=d/ZGrEJ+JTwVdyeeU2X4maGsy6
 yN2K3QcrkKbI5qWgvorZPZlEzkNBuVLBNZCRoHorr9s98p3fAEKjZ5QbdEcs9uu1Qxze1jmR95fkV
 Qoi6vHi3HQ3zph1XcndjTm4qKkeUtCZvrRpcktSxcqz5ZNDOMABEJaDOcTkqnczxY7Js=;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nehBr-0008Cj-6a
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 17:54:04 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220413175354euoutp021acdf352a12fa9ec301d2b366230150b~lhjz8J02c2275222752euoutp02c
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Apr 2022 17:53:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220413175354euoutp021acdf352a12fa9ec301d2b366230150b~lhjz8J02c2275222752euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649872435;
 bh=wo/jbDl2Y1287Vv2vMz4/0xE7T8FPBwlfmFXkoDZcCg=;
 h=Date:Subject:To:CC:From:In-Reply-To:References:From;
 b=emkaJwht2YERQRDq4gLAalpaNkXg1CxENEh26is3CFFjvp0d8ZV6r8C4vvKiaBs2V
 xooADdi1+nSiTaGaWvyUA6xr1Wk0j9Zylp+YB1clhIsuPpU5USgay+QK7NEazCPFNg
 zJELHgATV2FXmiU1ZIDEPImC0R7Q6l+kYm3az7Ec=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220413175354eucas1p2d92c23b7757f23e2909762e80fb34779~lhjzu2uhU1366813668eucas1p2R;
 Wed, 13 Apr 2022 17:53:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 4C.88.10009.23E07526; Wed, 13
 Apr 2022 18:53:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220413175354eucas1p125f61e33a90998c6fbde728dba641faa~lhjzOYggK1586715867eucas1p1Y;
 Wed, 13 Apr 2022 17:53:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220413175354eusmtrp1ff19989b373bc1f109ce3b35d90d0cb9~lhjzNygQq2220222202eusmtrp1S;
 Wed, 13 Apr 2022 17:53:54 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-3b-62570e32590d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 79.63.09522.23E07526; Wed, 13
 Apr 2022 18:53:54 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220413175354eusmtip1283907177300692902da66382d046cce~lhjzD5xSb2725727257eusmtip1j;
 Wed, 13 Apr 2022 17:53:54 +0000 (GMT)
Received: from [192.168.8.130] (106.210.248.178) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 13 Apr 2022 18:53:48 +0100
Message-ID: <6f508044-5329-f864-3879-c42a59d52366@samsung.com>
Date: Wed, 13 Apr 2022 19:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <YlcCSR2rTqOgOoxX@google.com>
X-Originating-IP: [106.210.248.178]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduznOV0jvvAkg19bdSxa278xWTxZP4vZ
 4tIid4sbE54yWqy5+ZTFgdVj56y77B6bVnWyeexe8JnJo/1AN1MASxSXTUpqTmZZapG+XQJX
 xuKNLYwFGzkq9p/9zNzAeIiti5GTQ0LAROLwo37GLkYuDiGBFYwSRye+YgJJCAl8YZT40pUF
 kfjMKDFtHkQCpOPPnx/MEInljBJXbm9hhKuaPHUrG0T7bkaJ3rUmIDavgJ1E98J1YN0sAqoS
 DbM/MULEBSVOznzCAmKLCkRI/Lr1iB3EFhZIldh64ygziM0sIC5x68l8sF4RARWJQ4sus4Ms
 YxboY5RY/mIC0CAODjYBLYnGTrBeTiBzV/s6VoheTYnW7b/ZIWx5ie1v5zBDfKAs8WPDaaj/
 ayXWHjsDNlNC4AWHxLzVR6HedJF4P3sXC4QtLPHq+BZ2CFtG4vTkHqh4tcTTG7+ZIZpbGCX6
 d65nAzlIQsBaou9MDoTpKPGvjwfC5JO48VYQ4hw+iUnbpjNPYFSdhRQSs5B8PAvJB7OQfLCA
 kWUVo3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYJo5/e/4px2Mc1991DvEyMTBeIhRgoNZ
 SYS3Xz00SYg3JbGyKrUoP76oNCe1+BCjNAeLkjhvcuaGRCGB9MSS1OzU1ILUIpgsEwenVAOT
 UXBtekhnP2vqRBeFa0F1L248l/954MBuTeYV3iEHGM7cMPLiz69fKrWPZ3aMhMVPK81A6+Nn
 zhr/XaJzZeJr25Vez3qu7f7B9Pg028W3UvWPEhnvZ6jdna26ffVhnU/GUy50mEfyfLux02Nb
 Fbuu+fK6r2wGTjeW/1TXz30WHL5njX9b6Ks7124nzQvwv7t39uWwZRwdr2omsqk+vmS5+CWn
 llzELTFNNuXLIRtF/9zkZ7xiF2FnPEskaO6zS88mtOy6vHltU/GRJJlZvNfeLdx5b2vv3PW5
 5XGMczaczkzZFPamsFwntG4pk2J5gHYHR9Nyx7mMct4CVwvXm0TYfva+0Rupon95rmT/r8U8
 SizFGYmGWsxFxYkAEtzDOKIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7pGfOFJBvv3slu0tn9jsniyfhaz
 xaVF7hY3JjxltFhz8ymLA6vHzll32T02repk89i94DOTR/uBbqYAlig9m6L80pJUhYz84hJb
 pWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jMUbWxgLNnJU7D/7mbmB8RBb
 FyMnh4SAicSfPz+Yuxi5OIQEljJKTHs9hQkiISPx6cpHdghbWOLPtS42iKKPjBJnTp9mh3B2
 M0rsuTmXBaSKV8BOonvhOrBuFgFViYbZnxgh4oISJ2c+AasRFYiQWLZrKpgtLJAqsfXGUWYQ
 m1lAXOLWk/lgvSICKhKHFl0GW8As0McosfzFBEaIbWsYJeZ+ngzkcHCwCWhJNHaCnccJZO5q
 X8cKMUhTonX7b3YIW15i+9s5zBAvKEv82HAa6udaiVf3dzNOYBSdheS+WUjumIVk1CwkoxYw
 sqxiFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjNFtx35u3sE479VHvUOMTByMhxglOJiVRHj7
 1UOThHhTEiurUovy44tKc1KLDzGaAgNpIrOUaHI+MEnklcQbmhmYGpqYWRqYWpoZK4nzehZ0
 JAoJpCeWpGanphakFsH0MXFwSjUwGQhvuvG2aoNfrdcb4UcVd7rq1oftDPNI9pMJnfxI/tX0
 nxpG8aoX10mZNZgYJCTMCGNfLmTn6jblye01NbzsOw4Wvfr0Z61M85Weq0ZVdwvvVPLJc+94
 nCy5pqtAcpddXlPWgYUWm9TffE703fx0wsNNfpfW+jtwhS79lKJ6SdLhgPxlq+0eRpEzNp1O
 khc0YdgT3iX6Z8qXo/3+1z9wqxysOGrxZKqLIs/R+DaPtLctO4S2/TNyafLN+vxN6Nf6+1Zs
 S7T+V/MIOwp8c3JWv8bP/dFC5Naxw7yLayWlnq3+GXJc/frkoK5XlV9WP5p9uuduZ++erfHf
 xdce79w081KU/bxft/Yd5xbtn+0vosRSnJFoqMVcVJwIANX75eVaAwAA
X-CMS-MailID: 20220413175354eucas1p125f61e33a90998c6fbde728dba641faa
X-Msg-Generator: CA
X-RootMTR: 20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35
References: <CGME20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35@eucas1p1.samsung.com>
 <20220413122940.133981-1-p.raghav@samsung.com> <YlcCSR2rTqOgOoxX@google.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, On 2022-04-13 19:03, Jaegeuk Kim wrote >> @@ -882,
 6
 +882, 11 @@ static int open_check_fs(char *path, int flag) >> return open(path,
 O_RDONLY | flag); >> } >> >> +static int is_power_of_2(unsigned long [...]
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.12 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.12 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nehBr-0008Cj-6a
Subject: Re: [f2fs-dev] [PATCH v2] libf2fs: don't allow mkfs / fsck on non
 power-of-2 zoned devices
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
Cc: javier.gonz@samsung.com, Damien.LeMoal@wdc.com, mcgrof@kernel.org,
 pankydev8@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

On 2022-04-13 19:03, Jaegeuk Kim wrote
>> @@ -882,6 +882,11 @@ static int open_check_fs(char *path, int flag)
>>  	return open(path, O_RDONLY | flag);
>>  }
>>  
>> +static int is_power_of_2(unsigned long n)
> 
> So, this needs to check 2MB alignment only?
> 
As I explained in the v1 thread, zoned support for f2fs assumes po2 zone
sizes. For e.g.,
static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
		struct block_device *bdev, block_t blkstart, block_t blklen)
{
	sector_t sector, nr_sects;
	block_t lblkstart = blkstart;
	int devi = 0;
...
...
		// Assumes zone sectors to be po2
		if (sector & (bdev_zone_sectors(bdev) - 1) ||
				nr_sects != bdev_zone_sectors(bdev)) {
			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted (block %x + %x)",
				 devi, sbi->s_ndevs ? FDEV(devi).path : "",
				 blkstart, blklen);
			return -EIO;
		}

...
}

So until non power of 2 zoned devices are supported in block layer and
f2fs, it is safer to reject non power of 2 devices during mkfs time. I
hope it clarifies.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
