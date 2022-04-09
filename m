Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B46614FA2F7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Apr 2022 06:51:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nd34U-0008PK-Mw; Sat, 09 Apr 2022 04:51:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+43fc5532e856fea764d1+6803+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nd34Q-0008Ng-7c; Sat, 09 Apr 2022 04:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fe1mhxHvUNcHX31X2/v6QhlWCpL7rHNmKlyfX6pAQx8=; b=X7acWgcgOVQw4DFFOyi4XgUo2Q
 xpKH50jisaUDnzoNxP3/VFU4ZRURR+72WSNnMDSC4gp4uk8sDg2M1M49UpZgo3O902GlgbahXOfQa
 i1LTzIqgYInU7kFgLgyy6EG/8OdleS2tBkZ0a5/Hnwi2BF1adcVhUsU07V+fDz/EunxM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fe1mhxHvUNcHX31X2/v6QhlWCpL7rHNmKlyfX6pAQx8=; b=YDJj43HwAPSDk71hh9HlSlzvOS
 MhSBRNEO4PT1GV31AnJShFe8C1xVAS7EZzNJy2x6XvdRxc4mlceaXYlma6scSP4KIfjSOVxUnsPxn
 jRNfPiI9Fes18VmPgnjkQiXdxpmNVKZRtLPZiYQwFXodaRxCc0HTXh7f/MYeWZUVls0w=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nd34K-00APb4-UI; Sat, 09 Apr 2022 04:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=fe1mhxHvUNcHX31X2/v6QhlWCpL7rHNmKlyfX6pAQx8=; b=Ln3yxSObowNxJM1FMrhr+K57R6
 b4hm67oQXj8QHYSsDtTeswkmQMzhTUbmcFXZ8wSKANWZ3f2uawh1SArLLQwyfG/9xFBJpY85CXdw2
 ds/PrbeW2qhvBxLbQUlZJnupwwXSwTpD5oVVdXoHNH+XQIFpfq6JutVFrQurNrlSwXfXPm8nAVF8g
 3O6uBqOGhFXMyQobgkP5h+IgaBO6+coY7mEesusFLc5Uf97qVgiCBrdqIzpOVhA93gJW7XwjtIRj9
 o9pUqGiB3fZ23DPiIOWZiMJonzuJNE4ezkBUWAzOu6pd1udnLd7cjlnkVEEt0MQfIsCBUce9aPyz9
 Bxbzzdhw==;
Received: from 213-147-167-116.nat.highway.webapn.at ([213.147.167.116]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd341-0020d9-Mx; Sat, 09 Apr 2022 04:51:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat,  9 Apr 2022 06:50:23 +0200
Message-Id: <20220409045043.23593-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409045043.23593-1-hch@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Sanitize the calling conventions and use a goto label to cleanup
    the code flow. Signed-off-by: Christoph Hellwig <hch@lst.de> Acked-by: Christoph
    Böhmwalder <christoph.boehmwalder@linbit.com> --- drivers/block/drbd/drbd_nl.c
    | 68 +++++++++++++++++++ 1 file chang [...] 
 
 Content analysis details:   (-2.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [198.137.202.133 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nd34K-00APb4-UI
Subject: [f2fs-dev] [PATCH 07/27] drbd: cleanup decide_on_discard_support
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org,
 =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

U2FuaXRpemUgdGhlIGNhbGxpbmcgY29udmVudGlvbnMgYW5kIHVzZSBhIGdvdG8gbGFiZWwgdG8g
Y2xlYW51cCB0aGUKY29kZSBmbG93LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+CkFja2VkLWJ5OiBDaHJpc3RvcGggQsO2aG13YWxkZXIgPGNocmlzdG9waC5i
b2VobXdhbGRlckBsaW5iaXQuY29tPgotLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMg
fCA2OCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzNSBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2Jsb2NrL2RyYmQvZHJiZF9ubC5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYwppbmRl
eCAwMjAzMGM5YzRkM2IxLi40MGJiMGIzNTZhNmQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2Nr
L2RyYmQvZHJiZF9ubC5jCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMKQEAgLTEy
MDQsMzggKzEyMDQsNDIgQEAgc3RhdGljIHVuc2lnbmVkIGludCBkcmJkX21heF9kaXNjYXJkX3Nl
Y3RvcnMoc3RydWN0IGRyYmRfY29ubmVjdGlvbiAqY29ubmVjdGlvbikKIH0KIAogc3RhdGljIHZv
aWQgZGVjaWRlX29uX2Rpc2NhcmRfc3VwcG9ydChzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRldmljZSwK
LQkJCXN0cnVjdCByZXF1ZXN0X3F1ZXVlICpxLAotCQkJc3RydWN0IHJlcXVlc3RfcXVldWUgKmIs
Ci0JCQlib29sIGRpc2NhcmRfemVyb2VzX2lmX2FsaWduZWQpCisJCXN0cnVjdCBkcmJkX2JhY2tp
bmdfZGV2ICpiZGV2KQogewotCS8qIHEgPSBkcmJkIGRldmljZSBxdWV1ZSAoZGV2aWNlLT5ycV9x
dWV1ZSkKLQkgKiBiID0gYmFja2luZyBkZXZpY2UgcXVldWUgKGRldmljZS0+bGRldi0+YmFja2lu
Z19iZGV2LT5iZF9kaXNrLT5xdWV1ZSksCi0JICogICAgIG9yIE5VTEwgaWYgZGlza2xlc3MKLQkg
Ki8KLQlzdHJ1Y3QgZHJiZF9jb25uZWN0aW9uICpjb25uZWN0aW9uID0gZmlyc3RfcGVlcl9kZXZp
Y2UoZGV2aWNlKS0+Y29ubmVjdGlvbjsKLQlib29sIGNhbl9kbyA9IGIgPyBibGtfcXVldWVfZGlz
Y2FyZChiKSA6IHRydWU7Ci0KLQlpZiAoY2FuX2RvICYmIGNvbm5lY3Rpb24tPmNzdGF0ZSA+PSBD
X0NPTk5FQ1RFRCAmJiAhKGNvbm5lY3Rpb24tPmFncmVlZF9mZWF0dXJlcyAmIERSQkRfRkZfVFJJ
TSkpIHsKLQkJY2FuX2RvID0gZmFsc2U7Ci0JCWRyYmRfaW5mbyhjb25uZWN0aW9uLCAicGVlciBE
UkJEIHRvbyBvbGQsIGRvZXMgbm90IHN1cHBvcnQgVFJJTTogZGlzYWJsaW5nIGRpc2NhcmRzXG4i
KTsKLQl9Ci0JaWYgKGNhbl9kbykgewotCQkvKiBXZSBkb24ndCBjYXJlIGZvciB0aGUgZ3JhbnVs
YXJpdHksIHJlYWxseS4KLQkJICogU3RhY2tpbmcgbGltaXRzIGJlbG93IHNob3VsZCBmaXggaXQg
Zm9yIHRoZSBsb2NhbAotCQkgKiBkZXZpY2UuICBXaGV0aGVyIG9yIG5vdCBpdCBpcyBhIHN1aXRh
YmxlIGdyYW51bGFyaXR5Ci0JCSAqIG9uIHRoZSByZW1vdGUgZGV2aWNlIGlzIG5vdCBvdXIgcHJv
YmxlbSwgcmVhbGx5LiBJZgotCQkgKiB5b3UgY2FyZSwgeW91IG5lZWQgdG8gdXNlIGRldmljZXMg
d2l0aCBzaW1pbGFyCi0JCSAqIHRvcG9sb2d5IG9uIGFsbCBwZWVycy4gKi8KLQkJYmxrX3F1ZXVl
X2Rpc2NhcmRfZ3JhbnVsYXJpdHkocSwgNTEyKTsKLQkJcS0+bGltaXRzLm1heF9kaXNjYXJkX3Nl
Y3RvcnMgPSBkcmJkX21heF9kaXNjYXJkX3NlY3RvcnMoY29ubmVjdGlvbik7Ci0JCWJsa19xdWV1
ZV9mbGFnX3NldChRVUVVRV9GTEFHX0RJU0NBUkQsIHEpOwotCQlxLT5saW1pdHMubWF4X3dyaXRl
X3plcm9lc19zZWN0b3JzID0gZHJiZF9tYXhfZGlzY2FyZF9zZWN0b3JzKGNvbm5lY3Rpb24pOwot
CX0gZWxzZSB7Ci0JCWJsa19xdWV1ZV9mbGFnX2NsZWFyKFFVRVVFX0ZMQUdfRElTQ0FSRCwgcSk7
Ci0JCWJsa19xdWV1ZV9kaXNjYXJkX2dyYW51bGFyaXR5KHEsIDApOwotCQlxLT5saW1pdHMubWF4
X2Rpc2NhcmRfc2VjdG9ycyA9IDA7Ci0JCXEtPmxpbWl0cy5tYXhfd3JpdGVfemVyb2VzX3NlY3Rv
cnMgPSAwOworCXN0cnVjdCBkcmJkX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24gPQorCQlmaXJzdF9w
ZWVyX2RldmljZShkZXZpY2UpLT5jb25uZWN0aW9uOworCXN0cnVjdCByZXF1ZXN0X3F1ZXVlICpx
ID0gZGV2aWNlLT5ycV9xdWV1ZTsKKworCWlmIChiZGV2ICYmICFibGtfcXVldWVfZGlzY2FyZChi
ZGV2LT5iYWNraW5nX2JkZXYtPmJkX2Rpc2stPnF1ZXVlKSkKKwkJZ290byBub3Rfc3VwcG9ydGVk
OworCisJaWYgKGNvbm5lY3Rpb24tPmNzdGF0ZSA+PSBDX0NPTk5FQ1RFRCAmJgorCSAgICAhKGNv
bm5lY3Rpb24tPmFncmVlZF9mZWF0dXJlcyAmIERSQkRfRkZfVFJJTSkpIHsKKwkJZHJiZF9pbmZv
KGNvbm5lY3Rpb24sCisJCQkicGVlciBEUkJEIHRvbyBvbGQsIGRvZXMgbm90IHN1cHBvcnQgVFJJ
TTogZGlzYWJsaW5nIGRpc2NhcmRzXG4iKTsKKwkJZ290byBub3Rfc3VwcG9ydGVkOwogCX0KKwor
CS8qCisJICogV2UgZG9uJ3QgY2FyZSBmb3IgdGhlIGdyYW51bGFyaXR5LCByZWFsbHkuCisJICoK
KwkgKiBTdGFja2luZyBsaW1pdHMgYmVsb3cgc2hvdWxkIGZpeCBpdCBmb3IgdGhlIGxvY2FsIGRl
dmljZS4gIFdoZXRoZXIgb3IKKwkgKiBub3QgaXQgaXMgYSBzdWl0YWJsZSBncmFudWxhcml0eSBv
biB0aGUgcmVtb3RlIGRldmljZSBpcyBub3Qgb3VyCisJICogcHJvYmxlbSwgcmVhbGx5LiBJZiB5
b3UgY2FyZSwgeW91IG5lZWQgdG8gdXNlIGRldmljZXMgd2l0aCBzaW1pbGFyCisJICogdG9wb2xv
Z3kgb24gYWxsIHBlZXJzLgorCSAqLworCWJsa19xdWV1ZV9kaXNjYXJkX2dyYW51bGFyaXR5KHEs
IDUxMik7CisJcS0+bGltaXRzLm1heF9kaXNjYXJkX3NlY3RvcnMgPSBkcmJkX21heF9kaXNjYXJk
X3NlY3RvcnMoY29ubmVjdGlvbik7CisJYmxrX3F1ZXVlX2ZsYWdfc2V0KFFVRVVFX0ZMQUdfRElT
Q0FSRCwgcSk7CisJcS0+bGltaXRzLm1heF93cml0ZV96ZXJvZXNfc2VjdG9ycyA9CisJCWRyYmRf
bWF4X2Rpc2NhcmRfc2VjdG9ycyhjb25uZWN0aW9uKTsKKwlyZXR1cm47CisKK25vdF9zdXBwb3J0
ZWQ6CisJYmxrX3F1ZXVlX2ZsYWdfY2xlYXIoUVVFVUVfRkxBR19ESVNDQVJELCBxKTsKKwlibGtf
cXVldWVfZGlzY2FyZF9ncmFudWxhcml0eShxLCAwKTsKKwlxLT5saW1pdHMubWF4X2Rpc2NhcmRf
c2VjdG9ycyA9IDA7CisJcS0+bGltaXRzLm1heF93cml0ZV96ZXJvZXNfc2VjdG9ycyA9IDA7CiB9
CiAKIHN0YXRpYyB2b2lkIGZpeHVwX2Rpc2NhcmRfaWZfbm90X3N1cHBvcnRlZChzdHJ1Y3QgcmVx
dWVzdF9xdWV1ZSAqcSkKQEAgLTEyNzMsNyArMTI3Nyw2IEBAIHN0YXRpYyB2b2lkIGRyYmRfc2V0
dXBfcXVldWVfcGFyYW0oc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsIHN0cnVjdCBkcmJkX2Jh
Y2tpCiAJdW5zaWduZWQgaW50IG1heF9zZWdtZW50cyA9IDA7CiAJc3RydWN0IHJlcXVlc3RfcXVl
dWUgKmIgPSBOVUxMOwogCXN0cnVjdCBkaXNrX2NvbmYgKmRjOwotCWJvb2wgZGlzY2FyZF96ZXJv
ZXNfaWZfYWxpZ25lZCA9IHRydWU7CiAKIAlpZiAoYmRldikgewogCQliID0gYmRldi0+YmFja2lu
Z19iZGV2LT5iZF9kaXNrLT5xdWV1ZTsKQEAgLTEyODIsNyArMTI4NSw2IEBAIHN0YXRpYyB2b2lk
IGRyYmRfc2V0dXBfcXVldWVfcGFyYW0oc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsIHN0cnVj
dCBkcmJkX2JhY2tpCiAJCXJjdV9yZWFkX2xvY2soKTsKIAkJZGMgPSByY3VfZGVyZWZlcmVuY2Uo
ZGV2aWNlLT5sZGV2LT5kaXNrX2NvbmYpOwogCQltYXhfc2VnbWVudHMgPSBkYy0+bWF4X2Jpb19i
dmVjczsKLQkJZGlzY2FyZF96ZXJvZXNfaWZfYWxpZ25lZCA9IGRjLT5kaXNjYXJkX3plcm9lc19p
Zl9hbGlnbmVkOwogCQlyY3VfcmVhZF91bmxvY2soKTsKIAogCQlibGtfc2V0X3N0YWNraW5nX2xp
bWl0cygmcS0+bGltaXRzKTsKQEAgLTEyOTIsNyArMTI5NCw3IEBAIHN0YXRpYyB2b2lkIGRyYmRf
c2V0dXBfcXVldWVfcGFyYW0oc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsIHN0cnVjdCBkcmJk
X2JhY2tpCiAJLyogVGhpcyBpcyB0aGUgd29ya2Fyb3VuZCBmb3IgImJpbyB3b3VsZCBuZWVkIHRv
LCBidXQgY2Fubm90LCBiZSBzcGxpdCIgKi8KIAlibGtfcXVldWVfbWF4X3NlZ21lbnRzKHEsIG1h
eF9zZWdtZW50cyA/IG1heF9zZWdtZW50cyA6IEJMS19NQVhfU0VHTUVOVFMpOwogCWJsa19xdWV1
ZV9zZWdtZW50X2JvdW5kYXJ5KHEsIFBBR0VfU0laRS0xKTsKLQlkZWNpZGVfb25fZGlzY2FyZF9z
dXBwb3J0KGRldmljZSwgcSwgYiwgZGlzY2FyZF96ZXJvZXNfaWZfYWxpZ25lZCk7CisJZGVjaWRl
X29uX2Rpc2NhcmRfc3VwcG9ydChkZXZpY2UsIGJkZXYpOwogCiAJaWYgKGIpIHsKIAkJYmxrX3N0
YWNrX2xpbWl0cygmcS0+bGltaXRzLCAmYi0+bGltaXRzLCAwKTsKLS0gCjIuMzAuMgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
