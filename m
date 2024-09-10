Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7A973B0F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 17:11:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1so2WA-0005y4-1s;
	Tue, 10 Sep 2024 15:10:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1so2W8-0005xu-5W
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 15:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tMfHqVkUXqCWtSwhV1wBahjAVG+ZNtgPS/8uMug7K84=; b=dewl70HdcC3ZLgFitKM09FwBUu
 /SuOT+PW5ckJDKB9ntHcUJwYf6EFv6E9G38NJn73ue2sZIovjcde4LemYiYx8jSETymmHX3ORg+ya
 k93IUavVSmNiO08rNs2EL4ZVhQNgBW/EeOQnJ2DT8Sxcu8qTLYKN3rEhwe0VT4HyH7EM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tMfHqVkUXqCWtSwhV1wBahjAVG+ZNtgPS/8uMug7K84=; b=S
 PxKZZWxmNchc4oD5yIDSQmalmhoffwvki61W8SQtiB7L1tDBH1cQnFTdZF6ONmxP5fGeBGwdKMGEn
 ElOwzIXfaII340zG5Qm83Fmu4WGaN7wHaDeJiLWjRrASLOcmXv0VIDvNv9TgaSTJr7grd6JYwxxk/
 CK2VGV/d7kpezJPM=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1so2W6-0006IL-Ic for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 15:10:56 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240910151042epoutp01f9c8eac4807ac0d19582920fee26ad00~z6p0GNApU0104601046epoutp01g
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Sep 2024 15:10:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240910151042epoutp01f9c8eac4807ac0d19582920fee26ad00~z6p0GNApU0104601046epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725981042;
 bh=tMfHqVkUXqCWtSwhV1wBahjAVG+ZNtgPS/8uMug7K84=;
 h=From:To:Cc:Subject:Date:References:From;
 b=pcvIAVn/I1Bf/bXsOgx5w6iBRfwpdFuCQHqjJ4DMhUJK/RR+cse37Wq4k6ZFPCbfR
 IZauhR8TlenMhNGh9hap4go+nOlEsOaYnFkrbFuiqwDmrcXn/IBIWb4jlLyrvr7/gN
 xLM/cvd2dM6zhO6MnK7xomfDqpVsQ9lSRBLuFP9g=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20240910151041epcas5p2048e076adae63fd931eff0bf46cfc739~z6pzhpH2J0258802588epcas5p2E;
 Tue, 10 Sep 2024 15:10:41 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.182]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4X36b43d18z4x9Pv; Tue, 10 Sep
 2024 15:10:40 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 57.86.08855.07160E66; Wed, 11 Sep 2024 00:10:40 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20240910151040epcas5p3f47fa7ea37a35f8b44dd9174689e1bb9~z6px9arLJ1076710767epcas5p3j;
 Tue, 10 Sep 2024 15:10:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240910151040epsmtrp2d8703cd5c3ed857f83a2ea796785047b~z6px8alcl0448904489epsmtrp2v;
 Tue, 10 Sep 2024 15:10:40 +0000 (GMT)
X-AuditID: b6c32a44-15fb870000002297-ea-66e061709026
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 87.DC.08964.F6160E66; Wed, 11 Sep 2024 00:10:39 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240910151035epsmtip265e38c1653c6a529f3d6411c350e9604~z6puGi-2A1662516625epsmtip2j;
 Tue, 10 Sep 2024 15:10:35 +0000 (GMT)
From: Kanchan Joshi <joshi.k@samsung.com>
To: axboe@kernel.dk, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
 brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz,
 jaegeuk@kernel.org, jlayton@kernel.org, chuck.lever@oracle.com,
 bvanassche@acm.org
Date: Tue, 10 Sep 2024 20:31:55 +0530
Message-Id: <20240910150200.6589-1-joshi.k@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xbVRzHPffe3ha05lIQjrAwrJvLmDCKUE4NDBMZuwuLIVkwmQr1hl4e
 A9qujzmNZhWETIi85mAwXntkQkEIZZsoYhy1vCdYxoBOSHElJCMbj85NBMGWy3T/fc7398r3
 d84R4CIH6S/IVOpYjZLJFpOexA3z3uAQNWNPCysY9kXN0yUkWjCvAFSxtIqjzel5DE39/D2G
 mpotGLpQmYchR1s1jtpLBOje704+Wr1q5CPL5gMSlffcAajbtg9ZLx1CP3YPEKj+6hwfFU10
 kuibvg0MtS4sEmjknz4eGqmu4b/lS4/dTqBHZtoJuqJ8kKTHbulpk/FLku64cpruanBidNeU
 gaSX52wEXXzNCOjhhl/4tNMUSJscD7BE4XtZ0Rkso2A1QawyVaXIVKbHiBOOyt+WR0rDJCES
 GYoSBymZHDZGHHckMSQ+M9vlWRx0ksnWu6RERqsV7z8QrVHpdWxQhkqrixGzakW2OkIdqmVy
 tHpleqiS1b0pCQsLj3QlfpiVYe/qwdUDAafKBpsxA1j0LgQeAkhFwLOTFqIQeApEVBeATTYT
 7g6IqBUAHfl+XOAxgPMtrdjTCsvtXzEu0A2gqaMWcAcngKPWKbIQCAQktReOntW7dR+qDoO9
 o5atJJwqx+Cy/VvS3crb1arZ4ABuJqjd0Gy0brGQioKWR3cBN24nrLI+4XO6FxyochBuxl16
 3vULuLsppJYE8OboXzhXEAeflN7lc+wN7/dd22Z/6HzYTXKcBe1/2AmOP4WdHcU8jmOhYX2S
 53aAuxy0/bCfm/Ui/GrNgbllSAnhmQIRl/0KnCmf2670g7Pnr2wzDT+vGALcGpPh5mUjWQoC
 q59xUP2Mg+r/hzUA3AheZtXanHQ2NVItUbIf/XeZqaocE9h67sFxnWCyfiO0B2AC0AOgABf7
 CEsOzKSJhArm409YjUqu0Wez2h4Q6VprGe7/UqrK9V+UOrkkQhYWIZVKI2RvSCViP+FCfq1C
 RKUzOjaLZdWs5mkdJvDwN2DyY51xsqO95ncla2W5XzwMTSvcN6b0uhd+mFAUjMjrTvYtHEua
 vlj6Qd4gMAZtzK+U7krYE2u9/856sH6hiP3NmThUJj5ddN5n3D7Fm/1sObkxYeb4a3lR0c95
 XYpN8x1WJRWEJxE7nD4/GauG1wZMf/Ia/QNaVClmlFJrT27LPdG0aPC0zTQUV/Bq+2v6R40y
 Y3281lpjtAXUSXfgx2WvzjK+Zkv54cmvycaJ928EtntPXB9YzB8fyqisrBt8BHPvxEdf/K5y
 NiTz77miMwlQvweIvAc7x0+97kFl9qoOvSCkbwX3t5pSb544t95e9/zmcnJKy84lm2o1+si5
 x7sPigltBiMJxjVa5l8Au/SqdwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRmVeSWpSXmKPExsWy7bCSvG5+4oM0g/vHTS1W3+1ns3h9+BOj
 xbQPP5kt/t99zmRx88BOJouVq48yWcye3sxk8WT9LGaLjf0cFo/vfGa3+LlsFbvF0f9v2Swm
 HbrGaLH3lrbFpUXuFnv2nmSxmL/sKbtF9/UdbBbLj/9jslj3+j2Lxfm/x1ktzs+aw+4g5nH5
 irfH+XsbWTymTTrF5nH5bKnHplWdbB6bl9R77F7wmclj980GNo+PT2+xePRtWcXocWbBEXaP
 z5vkPDY9ecsUwBvFZZOSmpNZllqkb5fAlfFg9yHmgpPSFRNPrWZqYHwv3MXIySEhYCJx9Mo5
 JhBbSGA3o8SlDUYQcXGJ5ms/2CFsYYmV/54D2VxANR8ZJTp2bAdq4OBgE9CUuDC5FKRGRGAd
 k8SKaT4gNcwCc5gklnduZwZJCAMtWN3whBHEZhFQlTi86hKYzStgLnH0y21GiAXyEjMvfWeH
 iAtKnJz5hAXEZgaKN2+dzTyBkW8WktQsJKkFjEyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1
 kvNzNzGC409Lcwfj9lUf9A4xMnEwHmKU4GBWEuHtt7uXJsSbklhZlVqUH19UmpNafIhRmoNF
 SZxX/EVvipBAemJJanZqakFqEUyWiYNTqoHJ6gffEdYCi0epl/5uf3BZ6KJJdbhnS6lDXHzC
 9flRAc6ZZrkGKc/cJ/BIM/Qu2KN11a5oadWu0MBS470l7gXTDr+o1Jt00mALr8yOjxuEUxNW
 nGiZO6m029tSkb345wNdznlMUV8DRYtNznl+uzl/QavMk7h5n/eLd2xbeMJY6cesJRd80xpv
 qwhvt5mnPNOW/7P6bu78hiLvxSVhbxS8jQLm/zBgu3ZO2WfbOaXcc/WLFfv2sV0/waeyc7FC
 Jbf8us6/4Yenut9q/7FY97T+LFteU1vvrSeSK1OS8vN2cu08Mp15R9zZ9UYCFb6zVyxL+ilQ
 deib3Mc1gQdn9XC8Mn3aMt3d5kvC/ykbuJWVWIozEg21mIuKEwHCFYnNLgMAAA==
X-CMS-MailID: 20240910151040epcas5p3f47fa7ea37a35f8b44dd9174689e1bb9
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240910151040epcas5p3f47fa7ea37a35f8b44dd9174689e1bb9
References: <CGME20240910151040epcas5p3f47fa7ea37a35f8b44dd9174689e1bb9@epcas5p3.samsung.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Current write-hint infrastructure supports 6
 temperature-based
 data lifetime hints. The series extends the infrastructure with a new
 temperature-agnostic
 placement-type hint. New fcntl codes F_{SET/GE [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1so2W6-0006IL-Ic
Subject: [f2fs-dev] [PATCH v5 0/5] data placement hints and FDP
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
Cc: vishak.g@samsung.com, linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Current write-hint infrastructure supports 6 temperature-based data
lifetime hints.
The series extends the infrastructure with a new temperature-agnostic
placement-type hint. New fcntl codes F_{SET/GET}_RW_HINT_EX allow to
send the hint type/value on file. See patch #3 commit description and
interface example below [*].

Overall this creates 127 placement hint values that users can pass.

Patch #5 adds the ability to map these new hint values to nvme-specific
placement-identifiers.
Patch #4 restricts SCSI to use only lifetime hint values.
Patch #1 and #2 are simple prep patches.

[*]
#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <inttypes.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <linux/fcntl.h>

int main(int argc, char *argv[])
{
        struct rw_hint_ex set_hint_ex={}, get_hint_ex={};
        int fd, ret;

        if (argc < 4) {
                fprintf(stderr, "Usage: %s file <hint type> <hint value>\n",
                        argv[0]);
                return 1;
        }

        fd = open(argv[1], O_CREAT|O_RDWR|O_DIRECT, 0644);
        if (fd < 0) {
                perror("open");
                return 1;
        }

        set_hint_ex.type = atoi(argv[2]);
        set_hint_ex.val = atol(argv[3]);

        ret = fcntl(fd, F_SET_RW_HINT_EX, &set_hint_ex);
        if (ret < 0) {
                perror("fcntl: Error, F_SET_RW_HINT_EX");
                goto close_fd;
        }
        ret = fcntl(fd, F_GET_RW_HINT_EX, &get_hint_ex);
        if (ret < 0) {
                perror("fcntl: Error, F_GET_RW_HINT_EX");
                goto close_fd;
        }
        printf("set_hint (%d,%llu)\nget_hint (%d,%llu)\n",
               set_hint_ex.type, set_hint_ex.val,
               get_hint_ex.type, get_hint_ex.val);

close_fd:
        close(fd);
        return 0;
}

/* set placement hint (type 2) with value 126 */
# ./a.out /dev/nvme0n1 2 126
set_hint (2,126)
get_hint (2,126)

/* invalid placement hint value */
# ./a.out /dev/nvme0n1 2 128
fcntl: Error, F_SET_RW_HINT_EX: Invalid argument

Changes since v4:
- Retain the size/type checking on the enum (Bart)
- Use the name "*_lifetime_hint" rather than "*_life_hint" (Bart)

Changes since v3:
- 4 new patches to introduce placement hints
- Make nvme patch use the placement hints rather than lifetime hints

Changes since v2:
- Base it on nvme-6.11 and resolve a merge conflict

Changes since v1:
- Reduce the fetched plids from 128 to 6 (Keith)
- Use struct_size for a calculation (Keith)
- Handle robot/sparse warning

Kanchan Joshi (4):
  fs, block: refactor enum rw_hint
  fcntl: rename rw_hint_* to rw_lifetime_hint_*
  fcntl: add F_{SET/GET}_RW_HINT_EX
  nvme: enable FDP support

Nitesh Shetty (1):
  sd: limit to use write life hints

 drivers/nvme/host/core.c   | 81 ++++++++++++++++++++++++++++++++++++++
 drivers/nvme/host/nvme.h   |  4 ++
 drivers/scsi/sd.c          |  7 ++--
 fs/buffer.c                |  4 +-
 fs/f2fs/f2fs.h             |  5 ++-
 fs/f2fs/segment.c          |  5 ++-
 fs/fcntl.c                 | 79 ++++++++++++++++++++++++++++++++++---
 include/linux/blk-mq.h     |  2 +-
 include/linux/blk_types.h  |  2 +-
 include/linux/fs.h         |  2 +-
 include/linux/nvme.h       | 19 +++++++++
 include/linux/rw_hint.h    | 17 +++++++-
 include/uapi/linux/fcntl.h | 14 +++++++
 13 files changed, 221 insertions(+), 20 deletions(-)

-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
