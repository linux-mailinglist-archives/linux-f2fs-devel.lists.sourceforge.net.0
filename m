Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DF387A722
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Mar 2024 12:35:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkMt8-0005eG-Vz;
	Wed, 13 Mar 2024 11:35:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s_min.jeong@samsung.com>) id 1rkMt7-0005e5-Cl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 11:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o6ngaGJT6sMQ0sj5kIMIyQJUOCiXhM3e9x+mfasClqo=; b=RvQkI2SjU3nbsF3Bv2EBOh76pO
 rnT0kxXcLu3afGApnk88vlud/UySyxvAp5leHmbeb9T7NW+3skDS3DxU4gUN6csELWt/kqFTWncVp
 RcPmCS9zAXhdhY15FCZOd/Hi+YIM/PFyf0hzNUlz/Wes0kiZ26UE26XBeD/DxarSir+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=o6ngaGJT6sMQ0sj5kIMIyQJUOCiXhM3e9x+mfasClqo=; b=Q
 7ahZVh+1GicpQFGpz2iHdKrNbUM4Pm4hLNpDABGtk5Qav4/l8+rvkswXbFKWAC4vGKNNZjKFG+G16
 WCUXVtN7YbrxyPP5KUar4UdHXn7mMVAk5trGdmp5uzBn4l2TCXaIQSzQsJPHCSgo8ijQJzwkA1AuV
 96Tfv7s8VInMfD5U=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkMst-0004oo-F6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 11:35:13 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20240313112652epoutp0368386abd7ba5942e604788ec2eb53063~8T1to4YDV0867008670epoutp03B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Mar 2024 11:26:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20240313112652epoutp0368386abd7ba5942e604788ec2eb53063~8T1to4YDV0867008670epoutp03B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1710329212;
 bh=o6ngaGJT6sMQ0sj5kIMIyQJUOCiXhM3e9x+mfasClqo=;
 h=From:To:Cc:Subject:Date:References:From;
 b=hwLbK7fRYv4hhJWnFNDt42HeltZoRu8C1hoEDuxZZHqcAdhvnZta8qqxpipWSHgDP
 x4IIxgPpRvTvUIVYgeN7AIQvCOI7v9ZmgV26he2LDWRQ9S5Lsm8wfDEFJm7WMTHoFg
 6qRbnvTrGVlPq+9AZt07D9SoGrMj+krMbaZXxzPA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240313112652epcas1p1f90dda2ac39c0010f7e36e8b2890fdb2~8T1tM7zIe0889908899epcas1p1I;
 Wed, 13 Mar 2024 11:26:52 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.38.248]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4TvpBM4knLz4x9Pp; Wed, 13 Mar
 2024 11:26:51 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 78.64.19104.B7D81F56; Wed, 13 Mar 2024 20:26:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20240313112650epcas1p3e65fdc5f6df18a4f700fa62bb5480b28~8T1r92KDh0101901019epcas1p3P;
 Wed, 13 Mar 2024 11:26:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240313112650epsmtrp13f0dc0d8f8829d2f9182c688f6d17ccc~8T1r9FWvX2300523005epsmtrp13;
 Wed, 13 Mar 2024 11:26:50 +0000 (GMT)
X-AuditID: b6c32a4c-80dff70000004aa0-c5-65f18d7b0df1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 5E.30.08755.A7D81F56; Wed, 13 Mar 2024 20:26:50 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.98.34]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240313112650epsmtip130c69cadd9fa5cb6e282857325ded076~8T1rvUMQr0971409714epsmtip1X;
 Wed, 13 Mar 2024 11:26:50 +0000 (GMT)
From: Sunmin Jeong <s_min.jeong@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, daehojeong@google.com
Date: Wed, 13 Mar 2024 20:26:19 +0900
Message-Id: <20240313112620.1061463-1-s_min.jeong@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmgW5178dUg8bfihanp55lspjavpfR
 4sn6WcwWlxa5W1zeNYfNYkHrbxaLLf+OsFos2PiI0WLG/qfsDpweCzaVemxa1cnmsXvBZyaP
 vi2rGD0+b5ILYI3KtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLx
 CdB1y8wBOkdJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BWoFecmFtcmpeul5da
 YmVoYGBkClSYkJ0x6+lKpoLnPBWXHv1jbGBcx9nFyMkhIWAi8X3BauYuRi4OIYE9jBInp3Sz
 gCSEBD4xSmzt54NIfGOUWPJ6DxNMR8eeeawQib2MEgu/HoJygDpW3vvJCFLFJqAj8XDqbbBR
 IgJ2ErduLmIFsZkF7jBKrHhQB2ILC3hIdLU+B6rh4GARUJW4MlMRJMwLVH685TgzxDJ5iZmX
 vrNDxAUlTs58wgIxRl6ieetssLMlBG6xS0w/e4YRosFFYkf3WqhmYYlXx7ewQ9hSEi/726Ds
 Yomj8zewQzQ3MErc+HoTKmEv0dzazAZyELOApsT6XfoQy/gk3n3tYQUJSwjwSnS0CUFUq0p0
 P1oCtUpaYtmxg1BTPCR2tl2DhmKsxLe1z1gmMMrNQvLCLCQvzEJYtoCReRWjVGpBcW56arJh
 gaFuXmo5PDKT83M3MYJTopbPDsbv6//qHWJk4mA8xCjBwawkwlun+DFViDclsbIqtSg/vqg0
 J7X4EKMpMFwnMkuJJucDk3JeSbyhiaWBiZmRiYWxpbGZkjjvmStlqUIC6YklqdmpqQWpRTB9
 TBycUg1MHUunzYs0fHdcPmr1Z97asskXs6PTK1wfFPhOyYnROHUxfp8En/WWN/WbZ2Wlpcb+
 u3aiI3Ha6ccnO470SV/pZgtQm/VRc+/FV4xBn3RUvvg0zCxb9ubig7pHNk6Caj7+1QLxm6/v
 +pfw6s4K+XIRoR9aL5/9OThvV+/Hkzan8uZ7pt/farqYve7K3p/bb0Xmlk/5sv5oQsm1cydr
 0k4lLvRd7WVQ5Mi15eeaNdH5/Fodfhf4my6VJX9qyK7beObjU79HS5k+yZewyjoneD65PNlY
 wphfOi+PcT//cpuSOzynjq3Ys8Pu94Vn6raH+Fb18pWsrFzDwy648tYbPdlDO7PTl1lK+Suc
 5/ih9SzGWomlOCPRUIu5qDgRABEsaoISBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsWy7bCSnG5V78dUg76zKhanp55lspjavpfR
 4sn6WcwWlxa5W1zeNYfNYkHrbxaLLf+OsFos2PiI0WLG/qfsDpweCzaVemxa1cnmsXvBZyaP
 vi2rGD0+b5ILYI3isklJzcksSy3St0vgypj1dCVTwXOeikuP/jE2MK7j7GLk5JAQMJHo2DOP
 tYuRi0NIYDejxJpdq5m6GDmAEtISx/4UQZjCEocPF0OUfGCUOLLwBgtIL5uAjsTDqbfBbBEB
 J4n/N9rZQYqYBR4xShxqWMgIkhAW8JDoan3OAjKIRUBV4spMRZAwr4CdxPGW48wQN8hLzLz0
 nR0iLihxcuYTsJnMQPHmrbOZJzDyzUKSmoUktYCRaRWjZGpBcW56brFhgWFearlecWJucWle
 ul5yfu4mRnDIamnuYNy+6oPeIUYmDsZDjBIczEoivHWKH1OFeFMSK6tSi/Lji0pzUosPMUpz
 sCiJ84q/6E0REkhPLEnNTk0tSC2CyTJxcEo1MK3/9u6tucwaiaOZ06dxt8Q+uJldfjL3W4xm
 01yzAzMUmpz3fSjo31e6IePvaVuWzCSWKj7O31eLL1Q18/511jx7bdeJx76fzsf97b+y99x+
 zc43SjfjvxervPsnsepOU8WcqfHNgcIH5GZz3JUwmTXxeFLE6j1v3iTHfOHW25ula780PCmS
 P7RW7girR6qERJ7Xqw9X/0WWpHK457/vn+m0587ZyO1CD8/v2Sq57reW64M31nJ8PJNzSptP
 TwvdbKH/3re5Siz0fCP327LDcUdEO7TPye6Zxygru/unX+MDoZXeK3fs3vdw0+wZCb0uF1zy
 A1TqzNkfqkrqaTkY/sxlWligJKxb1TVpX82bZiWW4oxEQy3mouJEAL9U4hHIAgAA
X-CMS-MailID: 20240313112650epcas1p3e65fdc5f6df18a4f700fa62bb5480b28
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240313112650epcas1p3e65fdc5f6df18a4f700fa62bb5480b28
References: <CGME20240313112650epcas1p3e65fdc5f6df18a4f700fa62bb5480b28@epcas1p3.samsung.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_update_inode, i_size of the atomic file isn't updated
 until FI_ATOMIC_COMMITTED flag is set. When committing atomic write right
 after the writeback of the inode, i_size of the raw inode will n [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rkMst-0004oo-F6
Subject: [f2fs-dev] [PATCH 1/2] f2fs: mark inode dirty for
 FI_ATOMIC_COMMITTED flag
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
Cc: linux-f2fs-devel@lists.sourceforge.net, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In f2fs_update_inode, i_size of the atomic file isn't updated until
FI_ATOMIC_COMMITTED flag is set. When committing atomic write right
after the writeback of the inode, i_size of the raw inode will not be
updated. It can cause the atomicity corruption due to a mismatch between
old file size and new data.

To prevent the problem, let's mark inode dirty for FI_ATOMIC_COMMITTED

Atomic write thread                   Writeback thread
                                        __writeback_single_inode
                                          write_inode
                                            f2fs_update_inode
                                              - skip i_size update
  f2fs_ioc_commit_atomic_write
    f2fs_commit_atomic_write
      set_inode_flag(inode, FI_ATOMIC_COMMITTED)
    f2fs_do_sync_file
      f2fs_fsync_node_pages
        - skip f2fs_update_inode since the inode is clean

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Cc: stable@vger.kernel.org #v5.19+
Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>
---
 fs/f2fs/f2fs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 543898482f8b..a000cb024dbe 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3039,6 +3039,7 @@ static inline void __mark_inode_dirty_flag(struct inode *inode,
 	case FI_INLINE_DOTS:
 	case FI_PIN_FILE:
 	case FI_COMPRESS_RELEASED:
+	case FI_ATOMIC_COMMITTED:
 		f2fs_mark_inode_dirty_sync(inode, true);
 	}
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
