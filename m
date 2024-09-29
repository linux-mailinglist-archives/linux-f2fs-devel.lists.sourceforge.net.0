Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC93989387
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Sep 2024 09:44:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1suobh-0007XC-9g;
	Sun, 29 Sep 2024 07:44:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1suobg-0007X4-69
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Sep 2024 07:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=va1upUG9uBPKoq4dK3vKX6KJ5qfvwL8khIyV+isnF6Q=; b=dFj5wG3NmwOp/sA1pQ9TVuof4r
 lfXbwCNF86jdPE7cVtX8gC04XLq3nauDjJ+Jq+fc8Uv1+obgTjigt4a7tURlHx+QKwYvP9yFyz0hF
 xdYeSzDhFVUCPf2t3OxvGA73huYlCK7wtkQ4GQvfarwlrnHhg5a08lbAf7SX/jrw/200=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=va1upUG9uBPKoq4dK3vKX6KJ5qfvwL8khIyV+isnF6Q=; b=U
 /wMsTqimtNKSKeR/dVvSMgPY4YxR3vMia6ajeRwCgGob1L0E9Jb11PBIQZFhRl0J1fhbhUvfzUfBk
 pwTGdIrNKdldfMQqcRUc0toikrUhMKOWgvTn3YFHDx9YevtPi9CjBUKfcmYbh1g1fc4mRmBPEIfd1
 HxmO70RaL2E7pPtU=;
Received: from mail-sgaapc01on2044.outbound.protection.outlook.com
 ([40.107.215.44] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1suobf-0005oK-Er for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Sep 2024 07:44:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnmTc2y2kvWEzCTGGPwqdJdMfhRNyrcvoqer1nBhsCe7OCQozHOU2c8EqoAEMlw/WLeM3Lpp4fdpjR5KIbhh8DwOHmggBZiEaYWqmr1Z7J+f73+0Nv6gorJEAfP5fDA3XXO3m4XGfh1A9awBeG/vUlhj/gTSox/xY5qZ+pfCnGgT2OrgJckH9oq1bEVm9kEvZzuMMZWCfCrU3912f6NEsxqAq7FRmvN8myIpovIomTAqDXQKE01tDrquLfszSxsAlqWINMHiZxQ31l/uQeS6V6Km1G1cEcArZVBf6Z//bAKbhajQVlUgj40spwI28RfFonNzkqfK5suhOevfn8OX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=va1upUG9uBPKoq4dK3vKX6KJ5qfvwL8khIyV+isnF6Q=;
 b=s9H8L8C2ZfJZtAqXuq/VKrKfYVt7hLVuFArG4HWgK3ook2fwX1RJaO09+FMI2GV/5xYS2mxCxbqndl7XAeV92GXkdcMhm50603REDnTA1nEKd+93uxYK6PNVUJP2IvDcg4mK4Fvs40JVju7VzOlrFb+ftSEhuyRqt2jZ5UMYkhL4Trdrci/cOb2z4oI75nBX5gbVDmed6r6u3j1PLjCktM/kXij69UwRa3bNQHGS6GxTynNDk49syIxc7+p1H0t86LBiaUpgFsJgLnNpJRMwp4Ts7rrLN4+2sV3nGE6lB8CrW7MxnoI1jnCK7mQqef8FWKfrx37RHgWoPV8+6ql/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=va1upUG9uBPKoq4dK3vKX6KJ5qfvwL8khIyV+isnF6Q=;
 b=bJ3a8iEzzixcRiIkKxP4QrTdSZbQEyNvjuXnk+JWT1XPo1EABqP4fYlvOzK7DRR2PEOIT7gQFi7WqksDKhDvY3VidzXDy8oK/Al7RddolGsA3ZHNQ/xq17wsgb+6EBtcDTYU/IJgbHWUyckeRi1YHzovdGz6bt1BdAjAigNogn5SG+M3c0rEodCgjbJX61/YalrsQc2Dcd688PGJHhzjhTzH3MtSUqSd66xPdeAyJQpKDjWve4+LlDKxnZYil8WRlrmeVkDg+Qg9HdAmG1hBUDtGGWx7voylHT5c59WI4vx5+3lgvI7FTlJ85Ns4ySYUhmXnZweqXUjilzuG6iPmoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by KL1PR0601MB5511.apcprd06.prod.outlook.com (2603:1096:820:bb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 07:44:25 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%5]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 07:44:25 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 29 Sep 2024 02:00:10 -0600
Message-Id: <20240929080011.3802327-1-hanqi@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR06CA0223.apcprd06.prod.outlook.com
 (2603:1096:4:68::31) To SEZPR06MB7140.apcprd06.prod.outlook.com
 (2603:1096:101:228::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7140:EE_|KL1PR0601MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 03895c3c-a19c-4351-44c2-08dce05a8a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KPMkcNd9979i7+zo4JWXJioIX0gu50cE1Qe0MgA51WiPa+jBlysCmQX7fejt?=
 =?us-ascii?Q?Imcmc6esAEIs5Hp0MTTRYQp3M7qFVFEpgiIP587OMqZhZfXalm3Vq62fpkT6?=
 =?us-ascii?Q?72BtSCD9rKainDnPHUa9qokIVqn6zi76lPiPUFQJ/pQGhe2JFU4DBHDBDrY3?=
 =?us-ascii?Q?iE89mU7UU7CN4p4zlaX/VrcEr1R7Kw9FpIB7dJIwjBzlEiwgT7eTWznm41fd?=
 =?us-ascii?Q?Fq2jUl+RYQLNuIJvJF0wiSPlC9vxeuJZzoe5bMPBAE6WSbDOsRz72ArAp1lv?=
 =?us-ascii?Q?kQf2GXzRhmmH2ePJH14/b2Q/3qgKh3tbMCdxb8qNzkYa54RV0+eVeBhOJ/ri?=
 =?us-ascii?Q?Ze4S6Za91HYguNUf8filrKcpNEcZmVKk/nZjLwje4Y4fF8F6KOlzKzZ+Quko?=
 =?us-ascii?Q?UOK6mbfbLcJ30kpFukO3euZSTTFVrBb9FIGjVxZt0mCRMqssp+bzlFhgTVVt?=
 =?us-ascii?Q?jGPeo380bV1u/04CDZnoxO7LsXuKsQUTUUpkcp/WYiuo1wEY13zNy1nDzrgH?=
 =?us-ascii?Q?lJUJDNRerxO32gTHXquwd68sxb//Q0lYF9m7i1CFFCDjha8GAYerv2PaD76i?=
 =?us-ascii?Q?eeqwhaevlbMLvkne1su6a3nELA8ePWXTX4LRn2tuHH8aZ9ptJJbxKSVnIt4p?=
 =?us-ascii?Q?QP99zREhkEMryT+MIq2s/55r5xl8xu4plpWP1gcaeqappbnlxevzfiSMg6dB?=
 =?us-ascii?Q?gteuScJTzMEIN3gxHwdjNSNSd99qjsXoC6RQeyJj3ioIo6SFPtY8lHL7X312?=
 =?us-ascii?Q?FTiaE3UxLMYgftA7YnHGb1CHoqeeX4Z+RNx0Wu2ecbKeOxp8D80RKG7V3ntd?=
 =?us-ascii?Q?agFnHlhe6Wddw1AD+OVMmEnsPSKbMvKbQ5iMlV+C9B+uG01oQa7utFicP8nb?=
 =?us-ascii?Q?BLWDhzyK1DHIR9Jo3SU5ekFtWqhM39SBJ/sMkoxNk2UG8gFZGxpFUM2cDboF?=
 =?us-ascii?Q?KyuoJEwGGNr0ZPI3ZH7lGRljGYmgNt/Zxn3EP6vgeWhzlPu9Ec2R8wQwZNF+?=
 =?us-ascii?Q?M72doCc8qkFYBor6cNboTKZxCBw94fPr4Ozq3ip6rwjeoKDHow7QpvRJeqtZ?=
 =?us-ascii?Q?9d+Vylf1zJdsQlOBvhgMwpzAd9qQb3j09GDvRAxrbfIdrQAMPqhcU4B65FKi?=
 =?us-ascii?Q?tUxS0yuS6q703d5KNJJHHl1yMSHzM9bk2Gnbf1nOow78Qw/wSgehOnDSS2My?=
 =?us-ascii?Q?6y9+Qn/M3pxhKmhpQKMv2+B2wWnFqhLZgpIZnhACxqGOfU7Zoi7VltbCXLDk?=
 =?us-ascii?Q?u5S10UdTAavqXNwFmlJ7vlj4aXkhSxGg3/xKPFl2y2ulvIIAK1GjkjnwhItj?=
 =?us-ascii?Q?kwQTWxkS3TGSFgx/uNAIN1Ats2GpDld3pOVfE+NZozxcbA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EbTvQ6VHhjNIPLenyG/4J3252sC3xSyV48+CselibUKy9Cb8+JjRRFtaAhVS?=
 =?us-ascii?Q?fu/ZSeNmIQT+OG5kPypNM84sXQQdw6rf/jfq8m5EPlXJw3OCuWh3DGO2HUe1?=
 =?us-ascii?Q?vQDLChfIkXisK50QD80BP4QUNl+sJAT9QtNY/g8xbL+YjdFN5nYiZvqBDYgV?=
 =?us-ascii?Q?rohDZKBtnJ40eHxA0BMhqT9wZ85TtwkFP2pRJzLzhN+/7PbT3r+BUb/dnb0W?=
 =?us-ascii?Q?kZ9hX5821sbKMMFMpiY10k571etgTA5Pn+l+QaF4EA3BrZkPnsRgjiMIQrQM?=
 =?us-ascii?Q?xCvre/zWsZ4AZN0fDzYtDGrHDSuqtvOY3KiuuXUUBVnaCSGTiIVfZ7EAscd0?=
 =?us-ascii?Q?LK8DuxlIsufLhW857AWzAV9mhkbjesVPLz5SXzGNBN3yAtjUXX5ILakC2jMI?=
 =?us-ascii?Q?rvavu7rBPGhFDMnm20UcMmOFvnT6Ji94GcXyqLqSlvcF1YnaLpoHkpHIBL3y?=
 =?us-ascii?Q?+BWN42g1hNPkgrZPvGsflKRwv0lJg9l1VrwQhe+lW4s7OxWwoJ3sDKlWMTk+?=
 =?us-ascii?Q?zVjbo3haFqiao4i+fVEfJDUP5rc1W2ja9FUSEkbKoQaWN9Tn9+qcnF/pp5Nl?=
 =?us-ascii?Q?UaX3OBCXi7knyf8SJjP1uZMMiIz8RUZXIidPuDGoOmU4NQjS0Tgq2DpE1bUj?=
 =?us-ascii?Q?YQrg0T4HJZSVOOx4D0QlXmcHl9oScHDVECSsUVzGz7XRZXdIwFJ2tJWMFmXs?=
 =?us-ascii?Q?svVqCnk4BTp5p5wQMjBQSaVJoCfCixPiw3yyKvvjSF1mOyP+0jL7C2e2zQ0o?=
 =?us-ascii?Q?vBCr7kfiZ0siV46AMK5xbsquhC9LZmNLwmm6qhD5rzwhv5Yw1kdZvlYzGGLP?=
 =?us-ascii?Q?roebCt/6wlMgno+YsJ/x8QEMDURczz7IUdm3i/x5EGy44dz8cPoM3D05P4NI?=
 =?us-ascii?Q?k180YeqMLrnPk6Oo9Z2UepFepNUEoaAmR2hBGdzD7RfWaxyebFBhAiuCb3Zo?=
 =?us-ascii?Q?gsA1zglZVHcxbZBUqMh9i9Sthy7+y9dDudsCJmDC7xfVwb6MJv42DFkR8Bwn?=
 =?us-ascii?Q?WL0NkTAfzDqTonWXuZ3KUQqd2Fp/PmAnFOt+QmB6pcL4DUjACvUMIc5GulBb?=
 =?us-ascii?Q?2mffHW/NjQqGmlsJ+PhMWhtuBqUZ5dwsTv8MuDAPYMFDZH3NJo+se4RfefH3?=
 =?us-ascii?Q?eft6/KO69WFhuwaq2I2Lk6MVNGn5WAuX9Wlwtyj2pGKdOoWAcZ1NGLeqc4Ts?=
 =?us-ascii?Q?O4/JrKad6zQ2MSbYGSI7LFj6+fZzq0odGcMJysv1mO+bwEMJTJNLbwsSGoZ1?=
 =?us-ascii?Q?Pf2n6oe83jNK+VegHM2BJz1wreX+BkwwYlLNoxBI3UMh0xD8qehEc/64eMHi?=
 =?us-ascii?Q?22xKQsiv6HzhOnIXoPnBgaj4gusVKm7QcaRbiLCKW3qscfgl+VQNZ8tGyVBW?=
 =?us-ascii?Q?zZLZMlPTGtewubnzmovvg/hhWfnJvOoUe+k0hcjbtqyOXgml6q2HciidmsTM?=
 =?us-ascii?Q?If96volR+XsbkxilE/jqnBoTFqadKEe2A0tPud4b14iUcJyYtkHbinm+Xx3S?=
 =?us-ascii?Q?UBzjdtMR2oJF+8m+dWmqoPRga3Qnhj29VzqzjbRHMjiaOvP237Ca7jiOpxBk?=
 =?us-ascii?Q?bP9qwczHtTltXNGwmxM3gu9+DKbN47CKN8crxnEC?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03895c3c-a19c-4351-44c2-08dce05a8a76
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 07:44:25.5768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0jnw2MkhPcUTKbJ+8C8v1vbiFVuP+jcPCdmq7xBKzCCOkUt2oC7Y9jLLfk/nPKL1Zn+E4H+PBAxcCT5CYUfGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5511
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  After release a file and subsequently reserve it, the FSCK
 flag is set when the file is deleted, as shown in the following backtrace:
 F2FS-fs (dm-48): Inconsistent i_blocks, ino:401231, iblocks:1448, sectors:1472
 fs_rec_info_write_type+0x58/0x274 f2fs_rec_info_write+0x1c/0x2c
 set_sbi_flag+0x74/0x98 dec_valid_block_count+0x150/0x190 [...] 
 Content analysis details:   (-1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.9 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.44 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1suobf-0005oK-Er
Subject: [f2fs-dev] [PATCH v2] f2fs: compress: fix inconsistent update of
 i_blocks in release_compress_blocks and reserve_compress_blocks
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
From: Qi Han via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Han <hanqi@vivo.com>
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

After release a file and subsequently reserve it, the FSCK flag is set
when the file is deleted, as shown in the following backtrace:

F2FS-fs (dm-48): Inconsistent i_blocks, ino:401231, iblocks:1448, sectors:1472
fs_rec_info_write_type+0x58/0x274
f2fs_rec_info_write+0x1c/0x2c
set_sbi_flag+0x74/0x98
dec_valid_block_count+0x150/0x190
f2fs_truncate_data_blocks_range+0x2d4/0x3cc
f2fs_do_truncate_blocks+0x2fc/0x5f0
f2fs_truncate_blocks+0x68/0x100
f2fs_truncate+0x80/0x128
f2fs_evict_inode+0x1a4/0x794
evict+0xd4/0x280
iput+0x238/0x284
do_unlinkat+0x1ac/0x298
__arm64_sys_unlinkat+0x48/0x68
invoke_syscall+0x58/0x11c

For clusters of the following type, i_blocks are decremented by 1 and
i_compr_blocks are incremented by 7 in release_compress_blocks, while
updates to i_blocks and i_compr_blocks are skipped in reserve_compress_blocks.

raw node:
D D D D D D D D
after compress:
C D D D D D D D
after reserve:
C D D D D D D D

Let's update i_blocks and i_compr_blocks properly in reserve_compress_blocks.

Fixes: eb8fbaa53374 ("f2fs: compress: fix to check unreleased compressed cluster")
Signed-off-by: Qi Han <hanqi@vivo.com>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9ae54c4c72fe..71d5ded9eeda 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3792,7 +3792,7 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count,
 		to_reserved = cluster_size - compr_blocks - reserved;
 
 		/* for the case all blocks in cluster were reserved */
-		if (to_reserved == 1) {
+		if (reserved && to_reserved == 1) {
 			dn->ofs_in_node += cluster_size;
 			goto next;
 		}
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
