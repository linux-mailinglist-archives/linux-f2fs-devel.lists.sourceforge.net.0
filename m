Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D16C966162
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2024 14:17:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sk0Z0-000175-QG;
	Fri, 30 Aug 2024 12:17:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <javier.gonz@samsung.com>) id 1sk0Yz-00016z-Pp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 12:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Content-Type:MIME-Version:
 Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DHfHERZ6en3013iCiK+PboFb1SXkYatz5nFnB7G0GlY=; b=UYkwB3qwGxDoqPbVkIG8eDdgf/
 LFPd8eCvmTZavw1PRemIpL6t93dW6wjwcmAZ1SbTsfp1L1ASaKijDKfW+PqCXqx9Uhuf4PGd7yWYw
 phjNU56ul7Brtc2ro9Wdtg2I+FKWwJ+mCX0rZZy5k60j0fisEcWbeyTAPrHJIFUenI+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:CC:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DHfHERZ6en3013iCiK+PboFb1SXkYatz5nFnB7G0GlY=; b=eBQbVoPvNMdILR6fwRUOP//SAf
 +vpIXx+SeGifKuSvKs0K0pPrZPyE9DnMBAsDWv12sGXvLFyHiNFx5z9iLkcFg8PJBkeQCwyGN0AuJ
 RL6oMRHP+EeAGdotXjuIiC+npXyfL5gSSuZT//wOVmp/lPB7+jfE5KFKY4k5B39tLm0o=;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sk0Yx-0008C4-Cj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 12:17:13 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240830115916euoutp02d8ce0f961650115108386f167a82149c~wf8hwxr8m2915529155euoutp02p
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Aug 2024 11:59:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240830115916euoutp02d8ce0f961650115108386f167a82149c~wf8hwxr8m2915529155euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725019156;
 bh=DHfHERZ6en3013iCiK+PboFb1SXkYatz5nFnB7G0GlY=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=gbYUKLEuEwKPI68ulqU/oAR4XTO9SPNEkHPy+P2ywlsjfpkAsGn/NOSwG6vv6E+5S
 fNASe1qmB/Y5wYMQZQhUjIQDaXrDJyxdSgON44sS5dJW6Dg7L93dKioAx6i79uIFEs
 qY/n5ZTa0YeeoVjAxhcq+NCleVZf5lL4ynjng54Y=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240830115915eucas1p1ec9aa5512061fffdee90f1cdc93ec447~wf8hdiS0U2675426754eucas1p1o;
 Fri, 30 Aug 2024 11:59:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 1D.45.09624.314B1D66; Fri, 30
 Aug 2024 12:59:15 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240830115915eucas1p122027e15f14938de31489f75c174b1fd~wf8g84L7A1990419904eucas1p1Y;
 Fri, 30 Aug 2024 11:59:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240830115915eusmtrp22562364f0592658a6eaf77b9fcae9cad~wf8g6O6Qc3191831918eusmtrp2T;
 Fri, 30 Aug 2024 11:59:15 +0000 (GMT)
X-AuditID: cbfec7f2-bfbff70000002598-02-66d1b41327b7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 45.87.14621.314B1D66; Fri, 30
 Aug 2024 12:59:15 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240830115914eusmtip2c32ae4bfe73d445aa2fd37cd74966ac0~wf8gp-A_b0276402764eusmtip2F;
 Fri, 30 Aug 2024 11:59:14 +0000 (GMT)
Received: from localhost (106.110.32.122) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 30 Aug 2024 12:59:14 +0100
Date: Fri, 30 Aug 2024 13:59:13 +0200
From: Javier =?utf-8?B?R29uesOhbGV6?= <javier.gonz@samsung.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Message-ID: <20240830115913.b5pcs7bo26wkj2it@ArmHalley.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240826170606.255718-1-joshi.k@samsung.com>
X-Originating-IP: [106.110.32.122]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDKsWRmVeSWpSXmKPExsWy7djP87rCWy6mGcz4qGOx+m4/m8Xrw58Y
 LaZ9+Mls8f/ucyaLlauPMlnMnt7MZPFk/Sxmi439HBY/l61it5h06Bqjxd5b2haXFrlb7Nl7
 ksVi/rKn7Bbd13ewWSw//o/JYt3r9ywOgh6Xr3h7nL+3kcVj2qRTbB6Xz5Z6bFrVyeaxeUm9
 x+4Fn5k8dt9sYPP4+PQWi8eZBUfYPT5vkgvgjuKySUnNySxLLdK3S+DKeLrkA2PBD+GK1nst
 TA2MZ/i7GDk5JARMJJ62/mHrYuTiEBJYwSjx7ehlVgjnC6PE8hsTmSCcz4wSby5OYYFpOXV+
 AlRiOaPE0Ts/WeCqll7ZCzVsC6PE3r71QBkODhYBVYknu7NButkE7CUuLbvFDGKLCKhLdEw/
 BzaJWeAvs0TL9DPsIAlhAUuJQ2ffsoLYvAK2EtMnbGCGsAUlTs58AnYGs4CVROeHJlaQ+cwC
 0hLL/3GAhDmBwv8/vGeHuFRJ4vGLt4wQdq3EqS23wHZJCNzilFh29wYbRMJF4tzU98wQtrDE
 q+NboJplJP7vnM8EYVdLNJw8AdXcwijR2rEVbLGEgLVE35kciBpHiYlLD0OF+SRuvBWEOJNP
 YtK26cwQYV6JjjYhiGo1idX33rBMYFSeheSxWUgem4Xw2AJG5lWM4qmlxbnpqcWGeanlesWJ
 ucWleel6yfm5mxiBCfD0v+OfdjDOffVR7xAjEwfjIUYJDmYlEd4Tx8+mCfGmJFZWpRblxxeV
 5qQWH2KU5mBREudVTZFPFRJITyxJzU5NLUgtgskycXBKNTD57XcxmrmxRlF3Cm/bdym9K5xx
 uyZczfgV9ccp+eL9x+bby0zf75Gp12M1DN4+O8zgo2Ng+qNP9XU7ZztL/HP5fv6zXtLPRXNN
 3ypUOgpsvnl/p7Z5s5h/2ZQDfj9SN07UVCjfsTFn0tLTPVNzS/lFvaw6cu2dz6d/Z3Q9e83t
 qOfnVWt1Gxyl/h3/EyQ1vYPli3x7bNRTlciyt4nz3EyMg5YrKX7317jKKKJ2oDe8QnjPqXiD
 o+ma2zi5849aJTo4+5/7riei+Wb6iymKjT940hPfxD9tOn1O999y8xWyIg0PJt3aUMvXr2M9
 5XD9B/sf+6tSC5MEfur2l5UUiqc789i+vdDILXwtRVtHVImlOCPRUIu5qDgRAOixgofvAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRmVeSWpSXmKPExsVy+t/xe7rCWy6mGbSvZrNYfbefzeL14U+M
 FtM+/GS2+H/3OZPFytVHmSxmT29msniyfhazxcZ+Doufy1axW0w6dI3RYu8tbYtLi9wt9uw9
 yWIxf9lTdovu6zvYLJYf/8dkse71exYHQY/LV7w9zt/byOIxbdIpNo/LZ0s9Nq3qZPPYvKTe
 Y/eCz0weu282sHl8fHqLxePMgiPsHp83yQVwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY
 6hkam8daGZkq6dvZpKTmZJalFunbJehlPF3ygbHgh3BF670WpgbGM/xdjJwcEgImEqfOT2Dq
 YuTiEBJYyigx4cY0doiEjMTGL1dZIWxhiT/Xutggij4ySryfdI0FwtnCKPF2/lqgKg4OFgFV
 iSe7s0Ea2ATsJS4tu8UMYosIqEt0TD8HtoFZ4DezxO7pa1lAEsIClhKHzr4F28ArYCsxfcIG
 ZoihvYwSq4/3s0EkBCVOznwC1sAsYCExc/55RpBlzALSEsv/cYCEOQWsJP5/eA91tZLE4xdv
 GSHsWonPf58xTmAUnoVk0iwkk2YhTFrAyLyKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMBFs
 O/Zz8w7Gea8+6h1iZOJgPMQowcGsJMJ74vjZNCHelMTKqtSi/Pii0pzU4kOMpsCgmMgsJZqc
 D0xFeSXxhmYGpoYmZpYGppZmxkrivG6Xz6cJCaQnlqRmp6YWpBbB9DFxcEo1MB1ab56TYjb3
 p9L1OboiyyKulM9afpV97sojyRqSmy8HbrEyfy1pHK/5+Itk7enID9uaWgr8VZdf3KT703S6
 snSV6Zk7Bw/UzZwhIzDP9uc85vXXvm/Xy1z2+k/axeXd/32VV1zkO6/P+tltbmLK0VMt21IL
 FFjk/SJOV0hUclknNC7u/mGmsGCS+RuO3s0+rAt0hHnXX2WzyZl/f7dc56oND3dPUK6Q+jpx
 rvKlNxEqx63ys9a9Kjjnv2OSYK+OVpOWW18QV3UIU4ELb4eDiubMafu+JoofXtHtqLLuaoKZ
 hqWSRf2v/qatHY1iz+cLPH33uHD25/LDyyr1fxVvZ6+r2rx+65l/P3Pm+HxcFqTEUpyRaKjF
 XFScCAAvKmsHjQMAAA==
X-CMS-MailID: 20240830115915eucas1p122027e15f14938de31489f75c174b1fd
X-Msg-Generator: CA
X-RootMTR: 20240826171409epcas5p306ba210a9815e202556778a4c105b440
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240826171409epcas5p306ba210a9815e202556778a4c105b440
References: <CGME20240826171409epcas5p306ba210a9815e202556778a4c105b440@epcas5p3.samsung.com>
 <20240826170606.255718-1-joshi.k@samsung.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 26.08.2024 22:36, Kanchan Joshi wrote: >Current write-hint
 infrastructure supports 6 temperature-based data life >hints. >The series
 extends the infrastructure with a new temperature-agnostic >plac [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.12 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [210.118.77.12 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [210.118.77.12 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.12 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sk0Yx-0008C4-Cj
Subject: Re: [f2fs-dev] [PATCH v4 0/5] Write-placement hints and FDP
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, sagi@grimberg.me, martin.petersen@oracle.com,
 gost.dev@samsung.com, jlayton@kernel.org, vishak.g@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 James.Bottomley@HansenPartnership.com, linux-fsdevel@vger.kernel.org,
 chuck.lever@oracle.com, linux-scsi@vger.kernel.org, kbusch@kernel.org,
 jaegeuk@kernel.org, hch@lst.de, bvanassche@acm.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 26.08.2024 22:36, Kanchan Joshi wrote:
>Current write-hint infrastructure supports 6 temperature-based data life
>hints.
>The series extends the infrastructure with a new temperature-agnostic
>placement-type hint. New fcntl codes F_{SET/GET}_RW_HINT_EX allow to
>send the hint type/value on file. See patch #3 commit description for
>the details.
>
>Overall this creates 128 placement hint values [*] that users can pass.
>Patch #5 adds the ability to map these new hint values to nvme-specific
>placement-identifiers.
>Patch #4 restricts SCSI to use only life hint values.
>Patch #1 and #2 are simple prep patches.
>
>[*] While the user-interface can support more, this limit is due to the
>in-kernel plumbing consideration of the inode size. Pahole showed 32-bit
>hole in the inode, but the code had this comment too:
>
>/* 32-bit hole reserved for expanding i_fsnotify_mask */
>
>Not must, but it will be good to know if a byte (or two) can be used
>here.
>
>Changes since v3:
>- 4 new patches to introduce write-placement hints
>- Make nvme patch use the placement hints rather than write-life hints
>
>Changes since v2:
>- Base it on nvme-6.11 and resolve a merge conflict
>
>Changes since v1:
>- Reduce the fetched plids from 128 to 6 (Keith)
>- Use struct_size for a calculation (Keith)
>- Handle robot/sparse warning
>
>Kanchan Joshi (4):
>  fs, block: refactor enum rw_hint
>  fcntl: rename rw_hint_* to rw_life_hint_*
>  fcntl: add F_{SET/GET}_RW_HINT_EX
>  nvme: enable FDP support
>
>Nitesh Shetty (1):
>  sd: limit to use write life hints
>
> drivers/nvme/host/core.c   | 81 ++++++++++++++++++++++++++++++++++++++
> drivers/nvme/host/nvme.h   |  4 ++
> drivers/scsi/sd.c          |  7 ++--
> fs/buffer.c                |  4 +-
> fs/f2fs/f2fs.h             |  4 +-
> fs/f2fs/segment.c          |  4 +-
> fs/fcntl.c                 | 79 ++++++++++++++++++++++++++++++++++---
> include/linux/blk-mq.h     |  2 +-
> include/linux/blk_types.h  |  2 +-
> include/linux/fs.h         |  2 +-
> include/linux/nvme.h       | 19 +++++++++
> include/linux/rw_hint.h    | 20 +++++++---
> include/uapi/linux/fcntl.h | 14 +++++++
> 13 files changed, 218 insertions(+), 24 deletions(-)
>
>-- 
>2.25.1
>

Keith, Christoph, Martin

Does this approach align with the offline conversation we had arund FMS?
Comments on the list would help us move forward with this series.

We would like to move the folks that are using off-tree patches for FDP
to mainline support.

Thanks,
Javier


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
