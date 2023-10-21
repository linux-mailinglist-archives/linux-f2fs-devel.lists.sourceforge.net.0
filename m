Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C68C7D1D11
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Oct 2023 14:11:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1quAoX-0005F1-Er;
	Sat, 21 Oct 2023 12:10:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xirui.zhang@vivo.com>) id 1quAoV-0005Eu-8R
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Oct 2023 12:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wrAkJASjP1/wM4gaqP1JNjGCXp3ig3iBpV0HG/4fbrQ=; b=fLu6/5ufC0TT/8/0YwevF/zF4H
 S4Y+kfvSG7kRf6PoikBSy3MoMxYiboxbtCYEL3u18TrkUp1jvXyyPCLAnykfqk0lZ9LsiCfJphkeW
 D4zz6Y0Hw6PwqHqqyRbdYKw0ZUNUueDRCzL+FCKsi5v4dSH2MMMt38zkfLIWs2lrVLqk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wrAkJASjP1/wM4gaqP1JNjGCXp3ig3iBpV0HG/4fbrQ=; b=i
 sBspno/vnKvWxjO7SuXYxIxn/vEB4xryZ70HL9jf5lqL/Lvry0R1m9dDQS2uvox4D4GwAW2ZXPrsA
 FlRMG8WOyubrDjkGhH3pjF2WuoLXSveiCadmYdus6SgAn5OMJu5DvoKpo2X4yFRhk8UflFZnaoTf8
 xrfCI4920oyp40oM=;
Received: from mail-psaapc01on2118.outbound.protection.outlook.com
 ([40.107.255.118] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1quAoQ-0056wB-JC for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Oct 2023 12:10:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpW81sFYUEdJ8ysRuNxS4wloviBIsHN0oQlFT1gtjtB3Z/e08/fejd+Drpy7bR6rJbY5v2cjlOxdT1lydWJRUGUYe5zDFTTY+fS/AVvJQyWiXGgMhOmPW1kATA3DMRZtrZTuUt1vL3rVka0PG37VqJtxtuJYbmqaoMMQYehV3mvtnsRuSKdhoByu0hMwj2ebhaZPxIaSXbHWtBv9jB2/GhJxi8FmJ7W/3CbfraUcEnjX/yzJtGvkpm+us0P8N7G+7uZaZbTVzUykL1D4NGV7rxlAYcj2XLmr8mPSqnB9q5xUnTpm42ZiYFA0DD84oKzJy3YzPbQ6AhAajZAcROcyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrAkJASjP1/wM4gaqP1JNjGCXp3ig3iBpV0HG/4fbrQ=;
 b=mLu13ZzW6nHqfEMMqY39A6XcPLJSdcm8YnIr+df5p846fHAa86RjlNE/3sP6d/KQwNdj6ExbLwfJjJ85bK0k2CBM64yVPERz8Y8vVh/B5XfMMXG0OHyomYf5y1dG45OgsLjAVYEAQDG6/otACkY8GJqRGzB4EoG7VuFqac4ztwuNaPXcoP8X8TJIO/BMu1WW9e7K3D7DsfcV8L8vHIqb3fCVTIfBm+qrWL2Qd1zAHEpftDKvvHsVJbZXcjzR6nSTutbxZAs3cWvjDJXbTDGS/gxPGXKePvRZpK4u2NbxnjzWnIYq6hhULJN5EloPxw0qspP5W5Cz1dE4+84UDxJXLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrAkJASjP1/wM4gaqP1JNjGCXp3ig3iBpV0HG/4fbrQ=;
 b=b00eXrvhRJbvyJKJ5iBs8lI9mbn0N9I9qR24Rlt3ai/51MHAbnAZMe52mhEO/spe6fIRGgWh2cKN0hc1djY/O0vGA8K5fpPh/MCCuZ458YwigLvYIVfVgrVV4zAhYzwAqp7pt7a5sa9Xl+JwPw6abkLVXu67On2Cpw56uGbH0LdT7IoMIG4xXQiHIeFh8sj2Y0Cqij7gwV3kuzhwOm39fITH+VhfM95MNq8LjqQRmDRyVqU7Brx9Agsi1fobQXCWe30Bcg4Nk7WvKat3xoylTzHmN/GtIZej/1Uxoe96NZdpHe3B8NL51lTc2IUN1InraROO+xdL19B5ujgUaz5Deg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5178.apcprd06.prod.outlook.com (2603:1096:400:1f7::12)
 by TYZPR06MB3904.apcprd06.prod.outlook.com (2603:1096:400:4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Sat, 21 Oct
 2023 12:10:29 +0000
Received: from TYZPR06MB5178.apcprd06.prod.outlook.com
 ([fe80::a74e:15a:8561:9b74]) by TYZPR06MB5178.apcprd06.prod.outlook.com
 ([fe80::a74e:15a:8561:9b74%3]) with mapi id 15.20.6907.025; Sat, 21 Oct 2023
 12:10:28 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 21 Oct 2023 06:19:07 -0600
Message-Id: <20231021121907.2908801-1-xirui.zhang@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To TYZPR06MB5178.apcprd06.prod.outlook.com
 (2603:1096:400:1f7::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5178:EE_|TYZPR06MB3904:EE_
X-MS-Office365-Filtering-Correlation-Id: b271fd51-a277-470c-dc81-08dbd22eb65f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H9jNJm+GcB/N2tAvU8ElxZcOxqNgYU99jiw3h0ol865B05SnV0z9vjethUV90zD/RzXl+kCa464gMRh6qnPB0FyQleBrc0ZfN7rDQ5i1E/FGvt6E0myrL8/zG61Td+PTTfgXsZdPTlIKZw18xpVoWAhLrJo/To/iQkDGDvFfXZWggP3koMP1wTYMmstzoV9ATsYNIPPyOIL2MQfDJjCdQntO4sJOekhRjyGJJStKzkoyTWGAysya/kSoscb8idrTp8PjhCc1h0WLBdtiQrJC/4+d864HK98it0rxbTCHfYUsJtXTEegGnLvx57CyfV7FnJslVHNprxHEMuqaCk8dCjmnzqEoF8BnunvYqe3JBoEqC2NA8Ar5z1wIxt/a2zWVhv/A8hom0Em+jVLCYkJsen4Q5z46Ufvnr8G6qwSIe0WldYnoe5Drgc+Oo8bd5dgkaA7o+hoBs4AwAVK8OtRbiyfcyTjbMFCFa7qQ6Dyf1zd0Iw0NgMOX7JmW1IN9yzmhmhrJ6pkylywoKiAkNb+3hM4QmdiaQRg0RJ9UXdWi4I5xJXtlOELCr75XT2zXkq+A0Fw2C/XUjyRDUUUAexEOVtPRJYm1v4lglQwsStcrMI21N86Zl6mUVBd6XXnswwCfb0kxOSykfxNTsyRrgTjV0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5178.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39850400004)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(107886003)(52116002)(6512007)(26005)(1076003)(478600001)(6506007)(6666004)(83380400001)(2906002)(66556008)(5660300002)(41300700001)(66476007)(66946007)(8936002)(4326008)(8676002)(316002)(2616005)(6486002)(38100700002)(86362001)(36756003)(38350700005)(43062005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r+MhNTjEd+54V4OLsGtApvKbVB+imX4AsQHgy5uywhHpskJSC1mMozcEWCGI?=
 =?us-ascii?Q?51e62HF+SD6nzU4Ugju7bAS8aZ+B66gvMrMgkf50IRC/wW8ceYXkUJYuLDu3?=
 =?us-ascii?Q?VjAfnN8KLYio/WrlZCjxvZF9yZPSKugUfq5cJ82oeq37SxNZZ+bu5ovsT//V?=
 =?us-ascii?Q?8qiaC9+TH7b3BW9i8csg8+BnF6QqKjAZGW2n+8kUPgDu9AOwbgH+iTEGVy+u?=
 =?us-ascii?Q?mHv3y/ZMtBG2JuYWUlICVIO62ePqFHqQRYW7pbBLATKKOx5QYTYTjyBRs+wP?=
 =?us-ascii?Q?A4euts6v6OrshnWXOFRwu9JXF+rjT7gKV+ialD9SPpFXUNKSkVYV4b0A3E+J?=
 =?us-ascii?Q?H/WhlqRgA/zeUinML4El/nmDZzx54Cb/n4i2LkdWy2IyAoE5m0yTIUYa3nVH?=
 =?us-ascii?Q?0C3Wj7vN6lAficsMpc7+CTdjErYhua2lKC/tx/mP5W6uiudC05JolOKT9piB?=
 =?us-ascii?Q?A2Oj+VG1DlJ7Dda0sggqIfryXJcc0DeQhmXSIWN/9gmPkVYijans9wOX/e5t?=
 =?us-ascii?Q?gpjyp6+9dz0k7+tQ+YlR3GCxVNGKQsMk42zJtttixnQmfKdfdnYkspi1cdsD?=
 =?us-ascii?Q?90brBzwSPPrBhnuM9saChcN/7eCNr/G5NcZcnl1drrciyRjXU3g6K/bfpFAI?=
 =?us-ascii?Q?p9cM4S0Cgce4QmCZ2Ox7+my8+u0Rsfw9ThdmybPvvYYV3We2Oq4N0xEfqIhU?=
 =?us-ascii?Q?FqlMqWCfoMEp5BZNBPNNyEBAORq0vNjEJD5DpLDhQVeFFLCUkk3r205kJ9Y4?=
 =?us-ascii?Q?f5hOrOTOtwbLiO4VXfRZf8hPl+qrcclnEVAuppbY+Tvw2QC/t1pM8jrF2HJj?=
 =?us-ascii?Q?+AhGF460lyaqeNrJahqul4qxahzEsh0Ixx6IYRRc+KeYilJtBn3FfPAxM8dI?=
 =?us-ascii?Q?GE3xTa6CzKoCyFjBRH4DoF5+w/eh688tUjzrpOZTkGxxMsyRljUsUvChbJ5V?=
 =?us-ascii?Q?vuIdUo8ADAV2kOWQxAcRamk2c5pgWk8UAVKlHO9VT7RG1Jcddscw3LErY+uK?=
 =?us-ascii?Q?wojKwO+iLKR8g/YAMK0Zd2rbJwosT0C6KR5baI81ufe2QFPKHVHO7XKjwBiM?=
 =?us-ascii?Q?OGCx3RXXsHXrkiej/yHT9/a/5D2U1BPU23YikU2w2qXhzfIaxrj4G6wHGCzA?=
 =?us-ascii?Q?1WMqBsyZAVCCJ40atOSkwN17uTAA6ZRQ2ikAHZbBNahI9cDVlgWowyHxhG/R?=
 =?us-ascii?Q?nrGWqEZzRgGvidwRSSuivvhz6KsROM977fbKKrPY4opNZnm8d5Jj+cGVacCE?=
 =?us-ascii?Q?o+4DYzqmm/5LZDIhNpUyA2Xzz2WaoF88xHOLu3+Z5BzreD7wpi/Rln8sASxi?=
 =?us-ascii?Q?lCRnF9RKbfrm3WlUagNvgw6jNT6ZCx2lzZJBFPV9i5sdv70d6bwKQFAlcxr8?=
 =?us-ascii?Q?rXiDY6yOXbxX070N+oeu/0GnHd7c7jBlHuJSv4WfZW7goT+g/lTf5yD4efOc?=
 =?us-ascii?Q?pifY58gseC0nRsbCxDy7NT8dt59RXV2UOBYcJneJE69BHwqVSyiwY3f35IUi?=
 =?us-ascii?Q?wwcsDNmsOzDh9ZfIjBt4GpflsRjoVf9tOkMfKIi0MPb1MvQFhp4IxGLOjGuw?=
 =?us-ascii?Q?wFXxRQMwAjpkZxKfAGrPiAdxJANwLZkGFspGePyp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b271fd51-a277-470c-dc81-08dbd22eb65f
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5178.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2023 12:10:28.1623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNz4m3yByNDR+GPXx9Re96T0CqPvpvgljMnPYpXH+lMOzzf4VbjLnn08hSxuleS+tkpDQ8nzYxDW3C6QyhAxzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3904
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: inode_lock_shared() -> down_read(&inode->i_rwsem)
 inode_lock()
 -> down_write(&inode->i_rwsem) Inode is not updated in f2fs_seek_block(),
 so there is no need to hold write lock, use read lock for more efficiency.
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.118 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.118 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1quAoQ-0056wB-JC
Subject: [f2fs-dev] [PATCH] f2fs: use inode_lock_shared instead of
 inode_lock in f2fs_seek_block()
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
From: zhangxirui via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhangxirui <xirui.zhang@vivo.com>
Cc: linux-kernel@vger.kernel.org, zhangxirui <xirui.zhang@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

aW5vZGVfbG9ja19zaGFyZWQoKSAtPiBkb3duX3JlYWQoJmlub2RlLT5pX3J3c2VtKQogICAgICAg
aW5vZGVfbG9jaygpIC0+IGRvd25fd3JpdGUoJmlub2RlLT5pX3J3c2VtKQoKSW5vZGUgaXMgbm90
IHVwZGF0ZWQgaW4gZjJmc19zZWVrX2Jsb2NrKCksIHNvIHRoZXJlIGlzIG5vIG5lZWQKdG8gaG9s
ZCB3cml0ZSBsb2NrLCB1c2UgcmVhZCBsb2NrIGZvciBtb3JlIGVmZmljaWVuY3kuCgpTaWduZWQt
b2ZmLWJ5OiB6aGFuZ3hpcnVpIDx4aXJ1aS56aGFuZ0B2aXZvLmNvbT4KLS0tCiBmcy9mMmZzL2Zp
bGUuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKaW5k
ZXggMzA0ZDA1MTZkM2E0Li5kNjAwZmY0ODkxNGYgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvZmlsZS5j
CisrKyBiL2ZzL2YyZnMvZmlsZS5jCkBAIC00MTgsNyArNDE4LDcgQEAgc3RhdGljIGxvZmZfdCBm
MmZzX3NlZWtfYmxvY2soc3RydWN0IGZpbGUgKmZpbGUsIGxvZmZfdCBvZmZzZXQsIGludCB3aGVu
Y2UpCiAgICAgICAgbG9mZl90IGlzaXplOwogICAgICAgIGludCBlcnIgPSAwOwoKLSAgICAgICBp
bm9kZV9sb2NrKGlub2RlKTsKKyAgICAgICBpbm9kZV9sb2NrX3NoYXJlZChpbm9kZSk7CgogICAg
ICAgIGlzaXplID0gaV9zaXplX3JlYWQoaW5vZGUpOwogICAgICAgIGlmIChvZmZzZXQgPj0gaXNp
emUpCkBAIC00ODMsMTAgKzQ4MywxMCBAQCBzdGF0aWMgbG9mZl90IGYyZnNfc2Vla19ibG9jayhz
dHJ1Y3QgZmlsZSAqZmlsZSwgbG9mZl90IG9mZnNldCwgaW50IHdoZW5jZSkKIGZvdW5kOgogICAg
ICAgIGlmICh3aGVuY2UgPT0gU0VFS19IT0xFICYmIGRhdGFfb2ZzID4gaXNpemUpCiAgICAgICAg
ICAgICAgICBkYXRhX29mcyA9IGlzaXplOwotICAgICAgIGlub2RlX3VubG9jayhpbm9kZSk7Cisg
ICAgICAgaW5vZGVfdW5sb2NrX3NoYXJlZChpbm9kZSk7CiAgICAgICAgcmV0dXJuIHZmc19zZXRw
b3MoZmlsZSwgZGF0YV9vZnMsIG1heGJ5dGVzKTsKIGZhaWw6Ci0gICAgICAgaW5vZGVfdW5sb2Nr
KGlub2RlKTsKKyAgICAgICBpbm9kZV91bmxvY2tfc2hhcmVkKGlub2RlKTsKICAgICAgICByZXR1
cm4gLUVOWElPOwogfQoKLS0KMi4zOS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18K5pys6YKu5Lu25Y+K5YW26ZmE5Lu25YaF5a655Y+v6IO95ZCr5pyJ5py65a+G5ZKML+aIluma
kOengeS/oeaBr++8jOS7heS+m+aMh+WumuS4quS6uuaIluacuuaehOS9v+eUqOOAguiLpeaCqOmd
nuWPkeS7tuS6uuaMh+WumuaUtuS7tuS6uuaIluWFtuS7o+eQhuS6uu+8jOivt+WLv+S9v+eUqOOA
geS8oOaSreOAgeWkjeWItuaIluWtmOWCqOatpOmCruS7tuS5i+S7u+S9leWGheWuueaIluWFtumZ
hOS7tuOAguWmguaCqOivr+aUtuacrOmCruS7tu+8jOivt+WNs+S7peWbnuWkjeaIlueUteivneaW
ueW8j+mAmuefpeWPkeS7tuS6uu+8jOW5tuWwhuWOn+Wni+mCruS7tuOAgemZhOS7tuWPiuWFtuaJ
gOacieWkjeacrOWIoOmZpOOAguiwouiwouOAggpUaGUgY29udGVudHMgb2YgdGhpcyBtZXNzYWdl
IGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIGFuZC9vciBwcml2
aWxlZ2VkIGluZm9ybWF0aW9uIGFuZCBhcmUgaW50ZW5kZWQgZXhjbHVzaXZlbHkgZm9yIHRoZSBh
ZGRyZXNzZWUocykuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhp
cyBtZXNzYWdlIG9yIHRoZWlyIGFnZW50LCBwbGVhc2Ugbm90ZSB0aGF0IGFueSB1c2UsIGRpc3Nl
bWluYXRpb24sIGNvcHlpbmcsIG9yIHN0b3JhZ2Ugb2YgdGhpcyBtZXNzYWdlIG9yIGl0cyBhdHRh
Y2htZW50cyBpcyBub3QgYWxsb3dlZC4gSWYgeW91IHJlY2VpdmUgdGhpcyBtZXNzYWdlIGluIGVy
cm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYnkgcmVwbHkgdGhlIG1lc3NhZ2Ugb3IgcGhv
bmUgYW5kIGRlbGV0ZSB0aGlzIG1lc3NhZ2UsIGFueSBhdHRhY2htZW50cyBhbmQgYW55IGNvcGll
cyBpbW1lZGlhdGVseS4KVGhhbmsgeW91CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
