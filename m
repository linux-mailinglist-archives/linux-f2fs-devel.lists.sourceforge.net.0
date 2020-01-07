Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30518131EA5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jan 2020 05:36:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iogbI-0006cD-FU; Tue, 07 Jan 2020 04:36:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <martin.petersen@oracle.com>) id 1iogbH-0006c6-6k
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 04:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:From:Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZkObfQJ3aLTfUDlWz1/H9GrUZm6vFEcO3N6e1Nr/N5o=; b=kX5ca7bszfeDfHcZjsJVOcVs90
 zEd8Z3ryLnNszh7Oays7QARh1xmwKhA6cYYyU4Pd/0Gua2fwM1cTsinHsDL5DZyhVL9BomfzKF5rL
 R0Z6abEFEXweIVuoTFc/ldX32UHC144/UypNkX0u8JIC07NW1s0XIeQYNMxiETZOVMVs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZkObfQJ3aLTfUDlWz1/H9GrUZm6vFEcO3N6e1Nr/N5o=; b=jTJ9/OXZbr2gIB4tJTfV4bxzHU
 ZKjfupduyq29B4DrAx3TDlSzzThhJlbPnyfu7Czc9u4Zav2bZFftds8S137/S0RaKbC0pbBTSE1al
 YeFyhY7ZSrVGmJREOnU+N7WykxaCsIWwqbW5U48nYNJgZoUoqrvxmNFAFIYuZHcKtpys=;
Received: from userp2120.oracle.com ([156.151.31.85])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iogb3-00C0Oz-F4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 04:36:15 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0074YsE1085910;
 Tue, 7 Jan 2020 04:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=ZkObfQJ3aLTfUDlWz1/H9GrUZm6vFEcO3N6e1Nr/N5o=;
 b=JWl7seMyh/sKhuxzW7P3DtP/EAoNB/SZAymx99crurUpfcuUv2SmthMjxXWWWv7mDraH
 i6CsGpnC0GKOilKE51Fb05b4L4J1Dp8d6e3okfZhjZ+wOA5rVz2/tuMlU78svT/EAuTS
 G4szSJtCcCZMvxErO6m+knjZAU4/Dv6q3+tdvqIJ2+De+DGNbiw3eJYeUsJcbMe4CocK
 yYqTqkdTwL2Sz9784mqjPo8Zd0Q0/OuAjtiJYVxTDAiyrdVUaHYLUpGvU9dkeBA4DmkA
 uuMPEdw+ZDirNPWX/teHMtNgkcWirHVfLeQdGVhTg5aZ1hJfAV/hUhUByWo5Ia+sKrCn Tg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2xakbqjvmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Jan 2020 04:35:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0074YEk7115196;
 Tue, 7 Jan 2020 04:35:52 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2xcjvc8hh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Jan 2020 04:35:51 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0074Zn7V027336;
 Tue, 7 Jan 2020 04:35:50 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 06 Jan 2020 20:35:49 -0800
To: Eric Biggers <ebiggers@kernel.org>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-3-satyat@google.com>
 <20191218212116.GA7476@magnolia> <yq1y2v9e37b.fsf@oracle.com>
 <20191218222726.GC47399@gmail.com> <yq1fthhdttv.fsf@oracle.com>
 <20191220035237.GB718@sol.localdomain>
Date: Mon, 06 Jan 2020 23:35:46 -0500
In-Reply-To: <20191220035237.GB718@sol.localdomain> (Eric Biggers's message of
 "Thu, 19 Dec 2019 19:52:37 -0800")
Message-ID: <yq136cr3mu5.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9492
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001070036
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9492
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001070036
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iogb3-00C0Oz-F4
Subject: Re: [f2fs-dev] [PATCH v6 2/9] block: Add encryption context to
 struct bio
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Kim Boojin <boojin.kim@samsung.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


Eric,

> However, the nature of the per-bio information is very different.
> Most of the complexity in blk-integrity is around managing of a
> separate integrity scatterlist for each bio, alongside the regular
> data scatterlist.

> That's not something we need or want for inline encryption.  For each
> bio we just need a key, algorithm, data unit number, and data unit
> size.  Since the data unit number (IV) is automatically incremented
> for each sector and the encryption is length-preserving, there's no
> per-sector data.

Fair enough. I just wanted to make sure that you guys had actually
looked at the integrity stuff and determined it wasn't a good fit.

> There are some ways the two features could be supported simultaneously
> without using more space, like making the pointer point to a linked
> list of tagged structs, or making the struct contain both a
> bio_crypt_ctx and bio_integrity_payload (or whichever combination is
> enabled in kconfig).

We have previously discussed having a facility in which you could chain
several different things (with different prep/endio functions) off a
bio. Similar to how we allow arbitrary stacking of block_devices. That
was actually my main interest in terms of opening the integrity can of
worms in this thread. Trying to find out which pieces of the plumbing,
if any, could potentially be made generic and feature-independent.

The copy offload efforts, which are now again picking up momentum, also
need to hang things off of the bio. That's the original reason the
integrity field became a union, fwiw.

> So if people really aren't willing to accept the extra 8 bytes per bio
> even behind a kconfig option, my vote is we that we put
> bi_crypt_context in the union with bi_integrity, and add a flag
> REQ_INLINECRYPT (like REQ_INTEGRITY) that indicates that the
> bi_crypt_context member of the union is valid.

Agreed.

> We'd also need some error-handling to prevent the two features from
> actually being used together.  It looks like there are several cases
> to consider.  One of them is what happens if bio_crypt_set_ctx() is
> called when blk-integrity verification or generation is enabled for
> the disk.

The integrity profile is only attached if the device driver identifies a
discovered device as capable. At least in the short term no device
should indicate simultaneous support for DIX and your crypto interface.

Not saying that sanity checks shouldn't exist. But I think both of these
features fall into things that are registered at device discovery time
so we shouldn't need to clutter the I/O hot path with mutual exclusivity
checks.

-- 
Martin K. Petersen	Oracle Linux Engineering


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
